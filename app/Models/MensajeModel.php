<?php

namespace App\Models;

use CodeIgniter\Model;

class MensajeModel extends Model
{
    protected $table            = 'mensajes';
    protected $allowedFields    = ['usuario_id', 'ticket_id', 'mensaje'];

    protected $useTimestamps = true;
}
