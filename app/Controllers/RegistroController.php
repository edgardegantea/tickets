<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\Area;
use App\Models\UserModel;

class RegistroController extends BaseController
{
    public function new()
    {
        $areas = model(Area::class);

        $data = [
            'title' => 'Nuevo registro de usuario',
            'areas' => $areas->findAll()
        ];
        return view('pages/registro', $data);
    }

    public function create()
    {
        $usuarioModel = new UserModel();

        $data = [
            'name' => $this->request->getPost('name'),
            'apaterno' => $this->request->getPost('apaterno'),
            'amaterno' => $this->request->getPost('amaterno'),
            'email' => $this->request->getPost('email'),
            'phone_no' => $this->request->getPost('phone_no'),
            'password' => password_hash($this->request->getPost('password'), PASSWORD_DEFAULT),
            'role' => 'usuario',
            'area' => $this->request->getPost('area')
        ];

        $image = $this->request->getFile('image');

        if ($image->isValid() && !$image->hasMoved()) {
            $newName = $image->getRandomName();
            $image->move('./uploads', $newName);
            $data['image'] = $newName;
        }

        $usuarioModel->insert($data);
        // $this->showAlert('Registro creado correctamente.', 'success');
        return redirect()->to('/login');
    }

}
