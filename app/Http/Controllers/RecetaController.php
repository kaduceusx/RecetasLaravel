<?php

namespace App\Http\Controllers;

use App\Models\Receta;
use Illuminate\Http\Request;
use App\Models\CategoriaReceta;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;

class RecetaController extends Controller
{
    public function __construct(){

        $this->middleware('auth', [
            'except' => ['show', 'search']
        ]);

    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //Auth::user()->recetas->dd();

        $usuario = auth()->user();

        //$recetas = Auth::user()->recetas;

        //Recetas con paginación
        $recetas = Receta::where('user_id', $usuario->id)->paginate(3);

        return view('recetas.index', compact('recetas','usuario'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //mostrar select con DB y con puck los campos que se requieran
        //DB::table('categoria_receta')->get()->pluck('nombre', 'id')->dd();

        //Obtener categorias sin modelo
        //$categorias = DB::table('categoria_recetas')->get()->pluck('nombre', 'id');

        //Obtener categorias con modelo
        $categorias = CategoriaReceta::all(['id', 'nombre']);

        return view('recetas.create', compact('categorias'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //por si quieres comprobar si el formulario trae algo
        //dd($request->all());
        //dd($request['imagen']);

        
        /* ------------------------------- Validacion ------------------------------- */
        $data = $request->validate([
            'titulo' => 'required|min:5',
            'categoria' => 'required',
            'ingredientes' => 'required',
            'preparacion' => 'required',
            'imagen' => 'required|image',
            'categoria' => 'required'
        ]);
        
        //Obtener la ruta de la imagen
        $rutaImagen = $request['imagen']->store('upload-recetas', 'public');

        //Resize de la imagen
        $img = Image::make(public_path("storage/{$rutaImagen}"))->fit(1000, 500);
        $img->save();

        /* ------------------- Insertar en la base de datos sin modelo ------------------- */
        // DB::table('recetas')->insert([
            // 'titulo' => $data['titulo'],
            // 'ingredientes' => $data['ingredientes'],
            // 'preparacion' => $data['preparacion'],
            // 'imagen' => $rutaImagen,
            // 'user_id' => Auth::user()->id,
            // "categoria_id" => $data['categoria']
        // ]);

        /* ----------------- Insertar en la base de datos con modelo ---------------- */
        Auth::user()->recetas()->create([
            'titulo' => $data['titulo'],
            'ingredientes' => $data['ingredientes'],
            'preparacion' => $data['preparacion'],
            'imagen' => $rutaImagen, 
            "categoria_id" => $data['categoria']
        ]);

        //Redireccionar despues de darle a crear recetas
        return redirect()->action('RecetaController@index');

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function show(Receta $receta)
    {
        //Obtener si el usuario actual le gusta la receta y esta autenticado
        $like = ( auth()->user() ) ? auth()->user()->meGusta->contains($receta->id) : false;

        //Pasar la cantidad de likes a la vista
        $likes = $receta->likes->count();

        return view("recetas.show", compact('receta', 'like', 'likes'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function edit(Receta $receta)
    {
        //Revisar policy
        $this->authorize('view', $receta);

        //Obtener categorias con modelo
        $categorias = CategoriaReceta::all(['id', 'nombre']);

        return view('recetas.edit', compact('categorias', 'receta'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Receta $receta)
    {
        //Revisar policy
        $this->authorize('update', $receta);

        /* ------------------------------- Validacion ------------------------------- */
        $data = $request->validate([
            'titulo' => 'required|min:5',
            'categoria' => 'required',
            'ingredientes' => 'required',
            'preparacion' => 'required',
            'categoria' => 'required'
        ]);

        //Asignar valores
        $receta->titulo = $data['titulo'];
        $receta->ingredientes = $data['ingredientes'];
        $receta->preparacion = $data['preparacion'];
        $receta->categoria_id = $data['categoria'];

        //Si el usuario sube una nueva imagen
        if(request('imagen')){
             //Obtener la ruta de la imagen
            $rutaImagen = $request['imagen']->store('upload-recetas', 'public');

            //Resize de la imagen
            $img = Image::make(public_path("storage/{$rutaImagen}"))->fit(1000, 500);
            $img->save();

            //Asignar al objeto
            $receta->imagen = $rutaImagen;
        }

        $receta->save();

        //Redireccionar
        return redirect()->action('RecetaController@index');


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function destroy(Receta $receta)
    {
        //Revisar policy
        $this->authorize('delete', $receta);

        //Eliminar la receta
        $receta->delete();

        //Redireccionar
        return redirect()->action('RecetaController@index');
    }

    public function search(Request $request)
    {
        //$busqueda = $request['buscar'];
        $busqueda = $request->get('buscar');

        $recetas = Receta::where('titulo', 'like', '%' . $busqueda . '%')->paginate(3);
        $recetas->appends(['buscar'=>$busqueda]);

        return view('busquedas.show', compact('recetas', 'busqueda'));
    }
}
