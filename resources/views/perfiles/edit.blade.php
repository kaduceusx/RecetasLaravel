@extends('layouts.app')


@section('estilos')
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/trix/1.3.1/trix.min.css" integrity="sha512-5m1IeUDKtuFGvfgz32VVD0Jd/ySGX7xdLxhqemTmThxHdgqlgPdupWoSN8ThtUSLpAGBvA8DY2oO7jJCrGdxoA==" crossorigin="anonymous" />
@endsection


@section('scripts')
   <script src="https://cdnjs.cloudflare.com/ajax/libs/trix/1.3.1/trix.js" integrity="sha512-/1nVu72YEESEbcmhE/EvjH/RxTg62EKvYWLG3NdeZibTCuEtW5M4z3aypcvsoZw03FAopi94y04GhuqRU9p+CQ==" crossorigin="anonymous" defer></script>
@endsection


@section('botones')

   <a class="btn btn-primary mr-2" href="{{ route('recetas.index') }}">Regresar al inicio</a>

@endsection


@section('content')
   
   <h1 class="text-center">Editar Perfil</h1>

   <div class="row justify-content-center mt-5">
      <div class="col-10 bg-white p-3">

         <form action="{{ route('perfiles.update', ['perfil' => $perfil->id]) }}" method="post" enctype="multipart/form-data">
            <!--directiva para decirle a laravel que la request viene de nuestra propia pagina-->
            @csrf

            <!--Agregar metodos al form ya que form html solo soporte get y post-->
            @method('PUT')

            <div class="form-group">
               <label for="nombre">Nombre</label>
               <input 
                  class="form-control  @error('nombre') is-invalid @enderror"
                  type="text" 
                  name="nombre" 
                  id="nombre"
                  placeholder="Nombre"
                  value="{{$perfil->usuario->name}}"
               >

               @error('nombre')
                  <span class="invalid-feedback d-block" role="alert">
                     <strong>{{$message}}</strong>
                  </span>
               @enderror
            </div>

            <div class="form-group">
               <label for="url">Sitio Web</label>
               <input 
                  class="form-control  @error('url') is-invalid @enderror"
                  type="text" 
                  name="url" 
                  id="url"
                  placeholder="Sitio web"
                  value="{{$perfil->usuario->url}}"
               >

               @error('url')
                  <span class="invalid-feedback d-block" role="alert">
                     <strong>{{$message}}</strong>
                  </span>
               @enderror
            </div>

            <div class="form-group mt-3">
               <label for="biografia">Biografía</label>
               <input 
                  type="hidden"
                  id="biografia"
                  name="biografia"
                  value="{{$perfil  ->biografia}}"
               >
               <trix-editor 
                     input="biografia"
                     class="form-control @error('biografia') is-invalid @enderror"
               >
               </trix-editor>

               @error('biografia')
                  <span class="invalid-feedback d-block" role="alert">
                     <strong>{{$message}}</strong>
                  </span>
               @enderror
            </div>

            <div class="form-group mt-3">
               <label for="imagen">Tu Imagen</label>
               <input 
                  class="form-control @error('imagen') is-invalid @enderror"
                  id="imagen" 
                  type="file"
                  name="imagen"
               >

               @if($perfil->imagen)
                  <div class="mt-4">
                     <p>Imagen Actual:</p>
                     <img width="300" src="/storage/{{$perfil->imagen}}" alt="Imagen del perfil">
                  </div>

                  @error('imagen')
                     <span class="invalid-feedback d-block" role="alert">
                        <strong>{{$message}}</strong>
                     </span>
                  @enderror
               @endif
            </div>

            <div class="form-group">
               <input 
                  class="btn btn-primary"
                  type="submit" 
                  value="Editar Perfil" 
               >
            </div>

         </form>

      </div>
   </div>

@endsection