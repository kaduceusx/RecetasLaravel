@extends('layouts.app')


@section('botones')
   
   @include('ui.navegacion')

@endsection



@section('content')
   
   <h2 class="text-center mb-5">Administrar Recetas</h2>

   <div class="col-10 mx-auto bg-white p-3">
      <table class="table">
         <thead class="bg-primary text-light">
            <tr>
               <th scope="col">Título</th>
               <th scope="col">Categoría</th>
               <th scope="col">Acciones</th>
            </tr>
         </thead>
         <tbody>
            @foreach($recetas as $receta)
               <tr>
                  <td>{{$receta->titulo}}</td>
                  <td>{{$receta->categoria->nombre}}</td>
                  <td>
                     <eliminar-receta receta-id={{$receta->id}}></eliminar-receta>
                     <a class="btn btn-dark d-block mb-1" href="{{route('recetas.edit', ['receta' => $receta->id]) }}">Editar</a>
                     <a class="btn btn-success d-block mb-1" href=" {{route('recetas.show', ['receta' => $receta->id]) }} ">Ver</a>
                  </td>
               </tr>
            @endforeach   
         </tbody>
      </table>  

      <div class="col-12 mt-4 justify-content-center d-flex">
         {{ $recetas->links() }}
      </div>

      <h2 class="text-center my-5">Recetas que te gustan</h2>
      <div class="col-md-10 mx-auto bg-white p-3">

         @if( count($usuario->meGusta)>0  )
            <ul class="list-group">
               @foreach($usuario->meGusta as $receta)
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                     <p>{{$receta->titulo}}</p>
                     <a class="btn btn-outline-success" href="{{route('recetas.show', ['receta' => $receta->id])}}">Ver</a>
                  </li>
               @endforeach
            </ul>
         @else
            <p class="text-center">No tienes recetas que les hayas dado likes.</p>
         @endif

         

      </div>
      
   </div>

@endsection
