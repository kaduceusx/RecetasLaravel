@extends('layouts.app')

@section('content')
   
   <div class="container" style="margin-top:-120px">
      <h2 class="titulo-categoria text-uppercase mb-4 mt-5">Categoría: {{$categoriaReceta->nombre}}</h2>

      <div class="row">
         @foreach($recetas as $receta)
            @include('ui.receta')
         @endforeach
      </div>

      <div class="d-flex justify-content-center mt-5">
         {{$recetas->links()}}
      </div>
   </div>

@endsection