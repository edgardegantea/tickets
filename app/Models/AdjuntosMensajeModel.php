<?php

namespace App\Models;

use CodeIgniter\Model;

class AdjuntosMensajeModel extends Model
{
    protected $table = 'adjuntos_mensaje';
    protected $primaryKey = 'id';
    protected $allowedFields = ['mensaje_id', 'file_name'];
}
