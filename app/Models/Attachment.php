<?php

namespace App\Models;

use CodeIgniter\Model;

class Attachment extends Model
{
    protected $table = 'attachments';
    protected $primaryKey = 'id';
    protected $allowedFields = ['ticket_id', 'file_name'];
}
