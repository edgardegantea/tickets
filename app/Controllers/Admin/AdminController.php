<?php

namespace App\Controllers\Admin;

use App\Models\Ticket;
use App\Controllers\BaseController;
use App\Models\UserModel;

class AdminController extends BaseController
{
    public function __construct()
    {
        if (session()->get('role') != "admin") {
            echo 'Acceso no autorizado';
            exit;
        }
    }
    

    public function index()
    {
        return view("admin/dashboard");
    }


    public function perfil() {
        $tickets = model('Ticket');
        $usuarios = model(UserModel::class);
        $db = \Config\Database::connect();
        $this->session = \Config\Services::session();
        $usuario = $usuarios->where('id', $this->session->id)->find();

        $totalTickets = $tickets->countAllResults();
        $ticketsAtendidos = $tickets->where('status', 's01')->countAllResults();

        $data = [
            'totalTickets'      => $totalTickets,
            'ticketsAtendidos'  => $ticketsAtendidos,
            'usuario'           => $usuario
        ];

        return view("admin/perfil", $data);
    }
}
 