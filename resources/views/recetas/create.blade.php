
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
   
   <h2 class="text-center mb-5">Crear nueva receta</h2>

   <div class="row justify-content-center mt-5">
      <div class="col-ms-8">

         <form action="{{route('recetas.store')}}" method="post" enctype="multipart/form-data" novalidate>
            <!--directiva para decirle a laravel que la request viene de nuestra propia pagina-->
            @csrf
            <div class="form-group">
               <label for="titulo">Título Receta</label>
               <input 
                  class="form-control  @error('titulo') is-invalid @enderror"
                  type="text" 
                  name="titulo" 
                  id="titulo"
                  placeholder="Título Receta"
               >

               @error('titulo')
                  <span class="invalid-feedback d-block" role="alert">
                     <strong>{{$message}}</strong>
                  </span>
               @enderror
            </div>

            <div class="form-group">

               <label for="categoria"></label>
               <select 
                  class="form-control @error('categoria') is-invalid @enderror" 
                  name="categoria" 
                  id="categoria"
               >
                  <option value="">--Seleccionar-</option>

                  @foreach($categorias as $categoria)
                     <option 
                        value="{{$categoria->id}}" 
                        {{old('categoria') == $categoria->id ? 'selected' : ''}}
                     >
                        {{$categoria->nombre}}
                     </option>
                  @endforeach

               </select>

               @error('categoria')
                  <span class="invalid-feedback d-block" role="alert">
                     <strong>{{$message}}</strong>
                  </span>
               @enderror

            </div>

            <div class="form-group mt-3">
               <label for="ingredientes">Ingredientes</label>
               <input 
                  type="hidden"
                  id="ingredientes"
                  name="ingredientes"
                  value="{{old('ingredientes')}}"
               >
               <trix-editor 
                  class="form-control @error('ingredientes') is-invalid @enderror"
                  input="ingredientes"
               >
               </trix-editor>

               @error('ingredientes')
                  <span class="invalid-feedback d-block" role="alert">
                     <strong>{{$message}}</strong>
                  </span>
               @enderror
            </div>

            <div class="form-group mt-3">
               <label for="preparacion">Preparación</label>
               <input 
                  type="hidden"
                  id="preparacion"
                  name="preparacion"
                  value="{{old('preparacion')}}"
               >
               <trix-editor 
                     input="preparacion"
                     class="form-control @error('preparacion') is-invalid @enderror"
               >
               </trix-editor>

               @error('preparacion')
                  <span class="invalid-feedback d-block" role="alert">
                     <strong>{{$message}}</strong>
                  </span>
               @enderror
            </div>

            <div class="form-group mt-3">
               <label for="imagen">Selecciona Imagen</label>
               <input 
                  class="form-control @error('imagen') is-invalid @enderror"
                  id="imagen" 
                  type="file"
                  name="imagen"
               >

               @error('imagen')
                  <span class="invalid-feedback d-block" role="alert">
                     <strong>{{$message}}</strong>
                  </span>
               @enderror
            </div>

            <div class="form-group">
               <input 
                  class="btn btn-primary"
                  type="submit" 
                  value="Crear Receta" 
               >
            </div>
         </form>

      </div>
   </div>

@endsection
