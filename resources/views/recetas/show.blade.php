@extends('layouts.app')

@section('content')
   {{-- <h1>{{$receta  }}</h1> --}}

   <article class="contenido-receta bg-white p-4 shadow" style="margin-top:-100px">
      <h1 class="text-center mb-4 mt-5">{{$receta->titulo}}</h1>

      <div class="imagen-receta mb-1">
         <img class="w-100" src="/storage/{{$receta->imagen}}" alt="Imagen de una receta">
      </div>

      <div class="receta-meta">
         <p>
            <span class="font-weight-bold text-primary mt-2">Escrito en la categoría:</span>
            <a 
               class="text-dark" 
               href="{{route('categorias.show', ['categoriaReceta' => $receta->categoria->id])}}"
            >
               {{$receta->categoria->nombre}}
            </a>
         </p>

         <p>
            <span class="font-weight-bold text-primary">Autor:</span>
            <a 
               class="text-dark" 
               href="{{route('perfiles.show', ['perfil' => $receta->autor->id])}}"
            >
               {{$receta->autor->name}}
            </a>
         </p>

         <p>
            <span class="font-weight-bold text-primary">Fecha:</span>

            @php
               $fecha = $receta->created_at; 
            @endphp

            <fecha-receta fecha="{{$fecha}}"></fecha-receta>

         </p>

         

         <div class="ingredientes mt-5">
            <h2 class="my-3 text-primary">Ingredientes</h2>
            {!!$receta->ingredientes!!}
         </div>

         <div class="preparacion">
            <h2 class="my-3 text-primary">Preparacion</h2>
            {!!$receta->preparacion!!}
         </div>

         <div class="justify-content-center row text-center">
            <like-button receta-id="{{$receta->id}}" like="{{$like}}" likes="{{$likes}}"></like-button>
         </div>

      </div>
   </article>
@endsection