<?php

namespace App\Controllers\Admin;

use CodeIgniter\RESTful\ResourceController;
use App\Models\Area;

class AreaController extends ResourceController
{
    private $area;

    public function __construct()
    {
        helper(['form', 'url', 'session']);
        $this->session = \Config\Services::session();
        $this->area = new Area;
    }


    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {

        $areas = $this->area->orderBy('id', 'desc')->findAll();

        $data = [
            'areas' => $areas,
            'title' => 'Áreas'
        ];
        
        return view('admin/areas/index', $data);
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {

        $area = $this->area->find($id);

        $data = [
            'area' => $area,
            'title' => 'Información del área seleccionada'
        ];
        
        if($area) {
            return view('admin/areas/show', $data);
        }
        else {
            return redirect()->to('/admin/areas');
        }
    }

    /**
     * Return a new resource object, with default properties
     *
     * @return mixed
     */
    public function new()
    {
        $title = 'Dar de alta nueva área';
        return view('admin/areas/create', compact('title'));
    }

    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return mixed
     */
    public function create()
    {
        $area = new Area;
        $inputs = $this->validate([
            'name'          => 'required|min_length[5]',
            'description'   => 'required|min_length[5]',
            'phone'         => 'required',
            'email'         => 'required'
            // 'active'        => 1
        ]);

        if (!$inputs) {
            return view('admin/areas/create', [
                'validation' => $this->validator,
                'area' => $area,
                'title' => 'Información del área seleccionada'
            ]);
        }

        $this->area->save([
            'name'          => $this->request->getVar('name'),
            'description'   => $this->request->getVar('description'),
            'phone'         => $this->request->getVar('phone'),
            'email'         => $this->request->getVar('email'),
            'active'        => 1
        ]);
        session()->setFlashdata('success', 'Success! post created.');
        return redirect()->to(site_url('/admin/areas'));
    }

    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */
    public function edit($id = null)
    {
        $area = $this->area->find($id);

        $data = [
            'area' => $area,
            'title' => 'Editar información del área seleccionada'
        ];

        if($area) {
            return view('admin/areas/edit', $data);
        }
        else {
            session()->setFlashdata('failed', 'Alert! no post found.');
            return redirect()->to('/admin/areas');
        }
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    public function update($id = null)
    {
        $inputs = $this->validate([
            'name'          => 'required|min_length[5]',
            'description'   => 'required|min_length[5]',
            'phone'         => 'required',
            'email'         => 'required'
        ]);

        if (!$inputs) {
            return view('admin/areas/create', [
                'validation' => $this->validator,
                'area' => $area,
                'title' => 'Información del área seleccionada'
            ]);
        }

        $this->area->save([
            'id' => $id,
            'name'          => $this->request->getVar('name'),
            'description'   => $this->request->getVar('description'),
            'phone'         => $this->request->getVar('phone'),
            'email'         => $this->request->getVar('email'),
            'active'        => 1
        ]);
        session()->setFlashdata('success', 'Success! post updated.');
        return redirect()->to(base_url('/admin/areas'));
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        $this->area->delete($id);
        session()->setFlashdata('success', 'Success! post deleted.');
        return redirect()->to(base_url('/admin/areas'));
    }
}
