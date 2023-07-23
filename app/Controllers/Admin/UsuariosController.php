<?php

namespace App\Controllers\Admin;

use CodeIgniter\RESTful\ResourceController;
use App\Models\UserModel;
use App\Models\Area;

class UsuariosController extends ResourceController
{

    private $usuario;
    private $areaModel;
    private $areas;
    private $db;

    public function __construct()
    {
        helper(['url', 'form', 'session']);
        $this->db = db_connect();
        $this->usuario = new UserModel;
        $this->areas = new Area;
        $this->session = \Config\Services::session();
    }


    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        $db = \Config\Database::connect();
        $this->session = \Config\Services::session();

        $builder = $this->db->table('users as u');
        $builder->select('u.*, a.name as area');
        $builder->join('areas as a', 'u.area = a.id');
        $usuarios = $builder->get()->getResult();

        $data = [
            'title'     => 'Usuarios',
            'usuarios'  => $usuarios
        ];

        return view('admin/usuarios/index', $data);
    }


    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {
        $usuario = $this->usuario->find($id);

        $data = [
            'usuario'   => $usuario,
            'title'     => 'Información de usuario'
        ];

        if ($usuario) {
            return view('admin/usuarios/show', $data);
        } else {
            return redirect()->to('admin/usuarios');
        }
    }


    /**
     * Return a new resource object, with default properties
     *
     * @return mixed
     */
    public function new()
    {
        $areas = model(Area::class);

        $data = [
            'title' => 'Nuevo registro de usuario',
            'areas' => $areas->findAll()
        ];

        return view('admin/usuarios/create', $data);
    }


    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return mixed
     */
    public function create()
    {
        $inputs = $this->validate([
            'name'      => 'required|min_length[3]|max_length[80]',
            'apaterno'  => 'required|min_length[3]|max_length[80]',
            'amaterno'  => 'required|min_length[3]|max_length[80]',
            'email'     => 'required|min_length[6]|max_length[80]|valid_email|is_unique[users.email]',
            'phone_no'  => 'required|min_length[6]|max_length[20]',
            'password'  => 'required|min_length[6]|max_length[200]',
            'role'      => 'required',
            'area'      => 'required'
        ]);

        if (!$inputs) {
            return view('admin/usuarios/create', [
                'validation' => $this->validator
            ]);
        }

        $usuario = new UserModel();
        $areas = model(Area::class);

        $this->usuario->save([
            'name'      => $this->request->getPost('name'),
            'apaterno'  => $this->request->getPost('apaterno'),
            'amaterno'  => $this->request->getPost('amaterno'),
            'email'     => $this->request->getPost('email'),
            'phone_no'  => $this->request->getPost('phone_no'),
            'password'  => password_hash($this->request->getPost('password'), PASSWORD_DEFAULT),
            'role'      => $this->request->getPost('role'),
            'area'      => $this->request->getPost('area')
        ]);
        session()->setFlashdata('success', 'Success! post created.');
        return redirect()->to(site_url('/admin/usuarios'));
    }



    public function edit($id = null)
    {
        $db = \Config\Database::connect();
        $usuarios = model(UserModel::class);
        $usuario = $usuarios->find($id);

        /*
        $builder2 = $this->db->table('users as u');
        $builder2->select('u.*, a.name as nombrearea');
        $builder2->join('areas as a', 'u.area = a.id');
        $usuario = $builder2->find($id)->getResult();
        */

        if ($usuario) {

            $areas = model(Area::class);

            $data = [
                'usuario'   => $usuario,
                'areas'     => $areas->findAll(),
                'title'     => 'Editar Información del usuario'
            ];

            return view('admin/usuarios/edit', $data);
        } else {
            session()->setFlashdata('failed', 'Registro no encontrado');
            return redirect()->to('/admin/usuarios');
        }
    }


    public function update($id = null)
    {
        /*
        $builder = $this->db->table('areas as a');
        $builder->select('a.*');
        $builder->join('users as u', 'a.id = u.area');

        $areaRelacionada = $builder->get()->getResult();

        $builder2 = $this->db->table('users as u');
        $builder2->select('u.*, a.name as nombrearea');
        $builder2->join('areas as a', 'u.area = a.id');

        $usuario = $builder2->get()->getResult();
        */


        $usuario = $this->usuario->find($id);

        $area = model(Area::class);
        $areas = $area->findAll();

        $inputs = $this->validate([
            'name'      => 'required|min_length[2]|max_length[80]',
            'apaterno'  => 'required|min_length[2]|max_length[80]',
            'amaterno'  => 'required|min_length[2]|max_length[80]',
            'email'     => 'required|min_length[6]|max_length[80]|valid_email',
            'phone_no'  => 'required|min_length[6]|max_length[20]',
            // 'password'  => 'required|min_length[6]|max_length[200]',
            'role'      => 'required',
            'area'      => 'required'
        ]);

        if (!$inputs) {
            return view('admin/usuarios/edit', [
                'usuario'   => $usuario,
                'validation' => $this->validator,
                'title' => 'Nuevo registro de usuario',
                // 'areas' => $areaRelacionada,
                'areas'     => $areas
            ]);
        }

        $this->usuario->save([
            'id' => $id,
            'name'      => $this->request->getPost('name'),
            'apaterno'  => $this->request->getPost('apaterno'),
            'amaterno'  => $this->request->getPost('amaterno'),
            'email'     => $this->request->getPost('email'),
            'phone_no'  => $this->request->getPost('phone_no'),
            'password'  => $this->usuario->password,
            'role'      => $this->request->getPost('role'),
            'area'      => $this->request->getPost('area')
        ]);
        session()->setFlashdata('success', 'Actualización correcta.');
        return redirect()->to(base_url('/admin/usuarios'));
    }




    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        $this->usuario->delete($id);

        session()->setFlashdata('success', 'Registro borrado de la base de datos');

        return redirect()->to(base_url('/admin/usuarios'));
    }











    public function editpwd($id = null)
    {
        $db = \Config\Database::connect();
        $usuarios = model(UserModel::class);
        $usuario = $usuarios->find($id);

        if ($usuario) {

            $areas = model(Area::class);

            $data = [
                'usuario'   => $usuario,
                'areas'     => $areas->findAll(),
                'title'     => 'Editar Información del usuario'
            ];

            return view('admin/usuarios/edit', $data);
        } else {
            session()->setFlashdata('failed', 'Registro no encontrado');
            return redirect()->to('/admin/usuarios');
        }
    }


    public function updatepwd($id = null)
    {
        $usuario = $this->usuario->find($id);

        $area = model(Area::class);
        $areas = $area->findAll();


        $inputs = $this->validate([
            /*
            'name'      => 'required|min_length[2]|max_length[80]',
            'apaterno'  => 'required|min_length[2]|max_length[80]',
            'amaterno'  => 'required|min_length[2]|max_length[80]',
            'email'     => 'required|min_length[6]|max_length[80]|valid_email',
            'phone_no'  => 'required|min_length[6]|max_length[20]',
            */
            'password'  => 'required|min_length[6]|max_length[200]',
            /*
            'role'      => 'required',
            'area'      => 'required'
            */
        ]);

        if (!$inputs) {
            return view('admin/usuarios/edit', [
                'usuario'   => $usuario,
                'validation' => $this->validator,
                'title' => 'Nuevo registro de usuario',
                // 'areas' => $areaRelacionada,
                'areas'     => $areas
            ]);
        }

        $this->usuario->save([
            'id' => $id,
            'name'      => $name,
            'apaterno'  => $apaterno,
            'amaterno'  => $amaterno,
            'email'     => $email,
            'phone_no'  => $phone_no,
            'password'  => password_hash($this->request->getPost('password'), PASSWORD_DEFAULT),
            'role'      => $role,
            'area'      => $area
        ]);
        session()->setFlashdata('success', 'Actualización correcta de contraseña.');
        return redirect()->to(base_url('/admin/usuarios'));
    }


}
