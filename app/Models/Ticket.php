<?php

namespace App\Models;

use CodeIgniter\Model;
use App\Entities\TicketEntity;

class Ticket extends Model
{
    protected $DBGroup          = 'default';
    protected $table            = 'tickets';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $insertID         = 0;
    // protected $returnType       = TicketEntity::class;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    // protected $protectFields    = true;
    protected $allowedFields    = ['usuario', 'category', 'priority', 'title',  'slug', 'description', 'file_name', 'url', 'status', 'phone', 'email', 'remote', 'dateMeeting', 'hourMeeting', 'ok'];

    // Dates
    protected $useTimestamps = true;
    // protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

}
