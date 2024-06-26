<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;
use App\Models\UserModel;

class User extends Seeder
{
    public function run()
    {
        $user_object = new UserModel();

        $user_object->insertBatch([

            [
                "name"          => "Admin",
                "apaterno"      => "Admin",
                "amaterno"      => "Admin",
                "email"         => "admin@mail.com",
                "phone_no"      => "2312066656",
                "password"      => password_hash("12345678", PASSWORD_DEFAULT),
                "role"          => "admin",
                "area"          => 1,
                "created_at"    => "2022-10-30 10:00:00"
            ],

            /*
            [
                "name"          => "Edgar",
                "apaterno"      => "Degante",
                "amaterno"      => "Aguilar",
                "email"         => "edgar@mail.com",
                "phone_no"      => "2311234567",
                "password"      => password_hash("12345678", PASSWORD_DEFAULT),
                "role"          => "admin",
                "area"          => 1,
                "created_at"    => "2022-10-30 10:00:00"
            ],

            
            [
                "name"          => "Guadalupe",
                "apaterno"      => "García",
                "amaterno"      => "toribio",
                "email"         => "guadalupe@mail.com",
                "phone_no"      => "2311234566",
                "password"      => password_hash("12345678", PASSWORD_DEFAULT),
                "role"          => "usuario",
                "area"          => 2,
                "created_at"    => "2022-10-30 10:00:05"
            ]
            */
        ]);
    }
}
