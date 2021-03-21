<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UsuarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = User::create([
            'name' => 'luis',
            'email' => 'luis@luis.com',
            'password' => Hash::make('luis_luis'),
            'url' => 'http://luis.com'
        ]);
        

        $user2 = User::create([
            'name' => 'fernando',
            'email' => 'fernando@fernando.com',
            'password' => Hash::make('fernando_fernando'),
            'url' => 'http://fernando.com'
        ]);
       

        

    }
}
