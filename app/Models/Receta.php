<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Receta extends Model
{
    use HasFactory;

    protected $fillable = [
        'titulo',
        'ingredientes',
        'preparacion',
        'imagen',
        'categoria_id'
    ];

    //Obtiene la categoria de la receta via foreig key
    public function categoria(){

        return $this->belongsTo(CategoriaReceta::class);

    }

    //Obtiene la informacion del usuario via foreing key
    public function autor(){

        return $this->belongsTo(User::class, 'user_id');

    }

    //Likes que ha recibido una receta
    public function likes(){

        return $this->belongsToMany(User::class, 'likes_receta');

    }
}
