<?php

namespace App\Controllers\Admin;

use App\Models\Ticket;
use App\Models\UserModel;
use CodeIgniter\RESTful\ResourceController;
use App\Models\Area;
use App\Models\Status;
use App\Models\Prioridad;
use App\Models\Categoria;
use CodeIgniter\Files\File;
use App\Models\MensajeModel;

// Usar dompdf para la generación de PDF
use Dompdf\Dompdf;

class TicketController extends ResourceController
{

    private $ticket;
    private $area;

    public function __construct()
    {
        helper(['url', 'form', 'session']);
        $db = db_connect();
        $this->db = db_connect();
        $pager = \Config\Services::pager();
        $this->ticket = new Ticket;
        $this->areas = new Area();
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
        $total = $db->table('tickets')->countAll();
        $tickets2 = model('Ticket');

        $builder = $db->table('status');
        $builder->join('tickets', 'tickets.status=status.id');
        $status = $builder->get();
        // $status = $builder->where('status.id', 'ASC')->get();

        $builder2 = $db->table('areas')->select('areas.name');
        $builder2->join('users', 'users.area = areas.id');
        $builder2->join('tickets', 'users.id = tickets.usuario');
        $usuario = $builder2->get();

        $this->session = \Config\Services::session();

        $builder3 = $this->db->table('tickets as t');
        $builder3->select('t.*, user.name, user.apaterno, user.amaterno, a.name as nombrearea, status.name as estado');
        $builder3->join('users as user', 't.usuario = user.id');
        $builder3->join('areas as a', 'user.area = a.id');
        $builder3->join('status', 't.status = status.id');
        $tickets = $builder3->get()->getResult();

        $data = [
            'title'     => 'Tickets de soporte',
            'total'     => $total,
            'status'    => $status,
            // // 'tickets'   => $tickets->findAll(),
            // 'tickets'   => $tickets->orderBy('status', 'ASC')->findAll()
            'tickets2'   => $tickets2->orderBy('id', 'desc')->findAll(),
            'usuario'   => $usuario,
            'tickets' => $tickets
        ];

        return view('admin/tickets/index', $data);
    }

    


    public function show($id = null)
    {
        $ticketModel = new Ticket();
        $mensajeModel = new MensajeModel();

        $data['ticket'] = $ticketModel->find($id);
        $data['mensajes'] = $mensajeModel->where('ticket_id', $id)->findAll();
        $data['title'] = "Ver ticket";

        return view('admin/tickets/show', $data);
    }




    /**
     * Return a new resource object, with default properties
     *
     * @return mixed
     */
    public function new()
    {
        $categories = model(Categoria::class);
        $priorities = model(Prioridad::class);
        $status = model(Status::class);
        $usuarios = model(UserModel::class);
        // $areas = model('Area');

        $data = [
            'title'         => 'Nuevo ticket de soporte',
            'status'        => $status->findAll(),
            'priorities'    => $priorities->findAll(),
            'categories'    => $categories->findAll(),
            'usuarios'      => $usuarios,
            // 'areas'         => $areas->findAll()
        ];
        return view('admin/tickets/create', $data);
    }

    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return mixed
     */
    public function create()
    {

        helper(['form']);

        $rules = [
            // 'usuario'       => 'required',
            'category'      => 'required',
            'priority'      => 'required',
            'title'         => 'required|min_length[5]|max_length[150]',
            'description'   => 'required|min_length[5]',
            // 'status'        => 'required',
            // 'email'         => 'required'
        ];

        if ($this->validate($rules)) {
            $ticketModel = new Ticket();

            $this->session = \Config\Services::session();


            $input = $this->validate([
                'uploaded[evidence]',
                'max_size[file,10240]',
            ]);

            if ($input) {
            


            // 'usuario', 'category', 'priority', 'title',  'slug', 'description', 'evidence', 'url', 'status', 'phone', 'email', 'remote', 'dateMeeting', 'hourMeeting', 'ok'

            $adjunto = $this->request->getFile('evidence');
            $nombreAdjunto = $adjunto->getRandomName();
            $archivo = $adjunto->move(ROOTPATH . 'public/uploads/tickets', $nombreAdjunto);
            


            
                $data = [

                // 'usuario'       => $this->request->getPost('usuario'),
                'usuario'       => $this->session->id,
                'category'      => $this->request->getPost('category'),
                'priority'      => $this->request->getPost('priority'),
                'title'         => $this->request->getPost('title'),
                'description'   => $this->request->getPost('description'),
                'slug'          => url_title($this->request->getPost('description'), '-', true),
                'evidence'      => $archivo,
                'url'           => $this->request->getPost('url'),
                'status'        => 's01',
                'phone'         => $this->request->getPost('phone'),
                'email'         => $this->request->getPost('email'),
                'remote'        => $this->request->getPost('remote'),
                'dateMeeting'   => $this->request->getPost('dateMeeting'),
                'hourMeeting'   => $this->request->getPost('hourMeeting'),
                'ok'            => true
            ];
            $ticketModel->save($data);
            return redirect()->to('admin/tickets');
            } else {

                 $data = [

                // 'usuario'       => $this->request->getPost('usuario'),
                'usuario'       => $this->session->id,
                'category'      => $this->request->getPost('category'),
                'priority'      => $this->request->getPost('priority'),
                'title'         => $this->request->getPost('title'),
                'description'   => $this->request->getPost('description'),
                'slug'          => url_title($this->request->getPost('description'), '-', true),
                // 'evidence'      => $archivo,
                'url'           => $this->request->getPost('url'),
                'status'        => 's01',
                'phone'         => $this->request->getPost('phone'),
                'email'         => $this->request->getPost('email'),
                'remote'        => $this->request->getPost('remote'),
                'dateMeeting'   => $this->request->getPost('dateMeeting'),
                'hourMeeting'   => $this->request->getPost('hourMeeting'),
                'ok'            => true
            ];
            $ticketModel->save($data);
            return redirect()->to('admin/tickets');

            }


            
        } else {
            $categories = model(Categoria::class);
            $priorities = model(Prioridad::class);
            $status     = model(Status::class);

            $data = [
                'validation' => $this->validator,
                'title'      => 'Nuevo registro',
                'categories'     => $categories->findAll(),
                'priorities'    => $priorities->findAll()
            ];
            echo view('admin/tickets/create', $data);
            // return view('usuarios/create', $data);
        }

    }




    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */
    public function edit($id = null)
    {
        $ticket = $this->ticket->find($id);
        if ($ticket) {
            $categories = model('Categoria');
            $priorities = model('Prioridad');
            $status     = model('Status');
            $usuarios   = model('UserModel');
            $areas = model('Area');

            $data = [
                'title'         => 'Nuevo ticket de soporte',
                'status'        => $status->findAll(),
                'priorities'    => $priorities->findAll(),
                'categories'    => $categories->findAll(),
                'usuarios'      => $usuarios->findAll(),
                'areas'         => $areas->findAll(),
                'ticket'        => $ticket
            ];

            return view('admin/tickets/edit', $data);
        } else {
            session()->setFlashdata('failed', 'Registro no encontrado');
            return redirect()->to('/admin/tickets');
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
            // 'area'          => 'required',
            'usuario'       => 'rquired',
            'category'      => 'required',
            'priority'      => 'required',
            'title'         => 'required|min_length[5]|max_length[150]',
            'description'   => 'required|min_length[5]',
            'status'        => 'required',
            'phone'         => 'required',
            'email'         => 'required'
        ]);

        if (!$inputs) {
            return view('admin/tickets/edit', [
                'validation' => $this->validator
            ]);
        }

        $this->ticket->save([
            'area'          => $this->request->getVar('area'),
            'usuario'       => $this->request->getVar('usuario'),
            'category'      => $this->request->getVar('category'),
            'priority'      => $this->request->getVar('priority'),
            'title'         => $this->request->getVar('title'),
            'slug'          => url_title($this->request->getVar('title'), '-', true),
            'description'   => $this->request->getVar('description'),
            'evidence'      => $this->request->getVar('evidence'),
            'url'           => $this->request->getVar('url'),
            'status'        => $this->request->getVar('status'),
            'phone'         => $this->request->getVar('phone'),
            'email'         => $this->request->getVar('email')
        ]);
        session()->setFlashdata('success', 'Registro actualizado');
        return redirect()->to(base_url('/admin/tickets'));
    }

    
    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        $this->ticket->delete($id);
        session()->setFlashdata('success', 'Registro eliminado con éxito');
        return redirect()->to(base_url('/admin/tickets'));
    }


    public function exportarXLSX()
    {
        echo 'Este script exporta datos de la base de datos a un archivo .xlsx';
    }

    
    public function exportarPDF()
    {
        echo "Aquí irá la exportación en PDF";
    }


    public function imprimirComprobante() 
    {
        return view('comprobante/imprimirComprobante');
    }


    public function generarPDF()
    {

        $mesx = date("n");
        $arrayMeses = array(
            1 => "Enero",
            2 => "Febrero",
            3 => "Marzo", 
            4 => "Abril", 
            5 => "Mayo", 
            6 => "Junio", 
            7 => "Julio", 
            8 => "Agosto", 
            9 => "Septiembre", 
            10 => "Octubre", 
            11 => "Noviembre", 
            12 => "Diciembre"
        );
        $mes = $arrayMeses[$mesx];

        $diax = date("w"); // Dia semana 0 a 6, donde 0 es domingo 
        $array_dia_semana = array(
            0 => "Domingo", 
            1 => "Lunes", 
            2 => "Martes", 
            3 => "Miércoles", 
            4 => "Jueves", 
            5 => "Viernes", 
            6 => "Sábado"
        );
        $dia_semana = $array_dia_semana[$diax];  

        $dia = date("d");    // Devuelve el día del mes
        $anio = date("Y");    // Devuelve el año

        $fecha = "$dia_semana $dia de $mes de $anio.";

        $pdf = new Dompdf();
        /*
        $pdf=new Dompdf();
        $html=file_get_contents("http://localhost:8080/tickets");
        $pdf->loadHtml($html);
        $pdf->setPaper("A7","landingpage");
        $pdf->render();
        $pdf->stream();
        */

        // Configuración necesaria para acceder a la data base.
        $hostname = "localhost";
        $usuariodb = "root";
        $passworddb = "";
        $dbname = "sistematickets";
            
        // Generando la conexión con el servidor
        $conectar = mysqli_connect($hostname, $usuariodb, $passworddb, $dbname);

        $mihtml = '<style>'.file_get_contents("assets/css/bulma.min.css").'</style>';

        //$mihtml 

        $mihtml .= '<table class="table is-striped is-bordered px-6">';
        $mihtml .= '<tr><td colspan=5 style="text-align:center">CONCENTRADO DE TICKETS DE SOPORTE</td></tr><br><br>';

        $mihtml .= '<tr><td colspan=5 style="text-align:left">Fecha: ' . $fecha .' </td></tr><br><br>';
        $mihtml .= '<thead style="font-size:10">';
        $mihtml .= '<tr>';
        $mihtml .= '<th>ID</th>';
        $mihtml .= '<th>Estado</th>';
        $mihtml .= '<th>Asunto</th>';
        $mihtml .= '<th>Email</th>';
        $mihtml .= '<th>Contacto</th>';
        $mihtml .= '</tr>';
        $mihtml .= '</thead>';
        $mihtml .= '<tbody style="font-size:8">';

        $db = \Config\Database::connect();
        $total = $db->table('tickets')->countAll();
        $ticketsNoIniciados = $db->table('tickets')->like('status', 's01')->countAllResults();
        $ticketsFinalizados = $db->table('tickets')->like('status', 's05')->countAllResults();

        $mihtml .= '<tr height=80px style="text-align:center"><td colspan=5 style="text-center">Total: ' . $total . ' tickets, de los cuales ' . $ticketsNoIniciados . ' tickets tienen estado NO INICIADO y '. $ticketsFinalizados. ' tickets FINALIZADOS</td>';
        

        // $tickets = model('Ticket');

        $resultado = "select * from tickets order by status asc";
        $resultado = mysqli_query($conectar, $resultado);
        
        while ($ticket = mysqli_fetch_assoc($resultado)) {
            $mihtml .= '<tr>';
            $mihtml .= '<td>' . $ticket['id'] . '</td>';
            if ($ticket['status'] == 's01') {
                            $mihtml .= '<td style="color:red">' . 'No iniciado' . '</td>';
                            } else if ($ticket['status'] == 's02') {
                                $mihtml .= '<td>' . 'Iniciado' . '</td>';
                            } else if ($ticket['status'] == 's03') {
                                $mihtml .= '<td>' . 'En revisión' . '</td>';
                            } else if ($ticket['status'] == 's04') {
                                $mihtml .= '<td>' . 'En proceso' . '</td>';
                            } else if ($ticket['status'] == 's05') {
                                $mihtml .= '<td style="color:green">' . 'Finalizado' . '</td>';
                            } else if ($ticket['status'] == 's06') {
                                $mihtml .= '<td>' . 'Abierto' . '</td>';
                            } else if ($ticket['status'] == 's07') {
                                $mihtml .= '<td>' . 'Reabierto' . '</td>';
                            } else if ($ticket['status'] == 's08') {
                                $mihtml .= '<td>' . 'Cerrado' . '</td>';
                            }
            $mihtml .= '<td>' . $ticket['title'] . '</td>';
            $mihtml .= '<td>' . $ticket['email'] . '</td>';
            $mihtml .= '<td>' . $ticket['phone'] . '</td>';
            $mihtml .= '</tr>';
        }


        $mihtml .= '</tr>';

        $mihtml .= '</tbody>';
        $mihtml .= '</table>';

        
        $pdf->loadHtml($mihtml);
        $pdf->setPaper("Letter", "landingpage");
        $pdf->render();
        $pdf->stream();
        
    }



    public function misTickets()
    {

        $db = \Config\Database::connect();
        $this->session = \Config\Services::session();

        
        $total = $db->table('tickets')->countAll();

        $builder3 = $this->db->table('tickets as t');
        $builder3->select('t.*, user.name, user.apaterno, user.amaterno, a.name as nombrearea, status.name as estado');
        $builder3->join('users as user', 't.usuario = user.id');
        $builder3->join('areas as a', 'user.area = a.id');
        $builder3->join('status', 't.status = status.id');
       
        $tickets = $builder3->where('usuario', $this->session->id)->get()->getResult();

        $data = [
            'title'     => 'Tickets de soporte',
            'total'     => $total,
            'tickets' => $tickets
        ];

        return view('admin/tickets/misTickets', $data);
    }



    /*  FUNCIÓN PARA ENVIAR EMAIL */
    public function enviarEmail()
    {

        $ticket = $this->ticket->find($id);
        if ($ticket) {
            
            $data = [
                'ticket' => $ticket,
                'status' => $st,
                'title' => "Información del ticket de soporte seleccionado"
            ];

            return view('admin/tickets/show', $data);
        } else {
            return redirect()->to('admin/tickets');
        }


        $db = \Config\Database::connect();
        $this->session = \Config\Services::session();
        $email = \Config\Services::email();
        
        // $email->setFrom($this->session->email, 'Sistema de Tickets de Soporte');
        $email->setTo();

        $email->setSubject('Email de prueba desde Sistema de Tickets de Soporte');
        $email->setMessage('Este es un email de prueba enviado desde codeigniter 4');

        $email->send();

        if ($email->send()) {
            return 'Éxito';
        }
    }




    

    public function agregarMensaje($ticketId)
    {
        return view('admin/mensajes/create', ['ticketId' => $ticketId]);
    }



    public function guardarMensaje()
    {
        $mensajeModel = new MensajeModel();

        $data = [
            'ticket_id' => $this->request->getPost('ticket_id'),
            'mensaje'   => $this->request->getPost('mensaje'),
        ];

        $mensajeModel->insert($data);
        return redirect()->to('/admin/tickets/' . $data['id']);
    }

}
