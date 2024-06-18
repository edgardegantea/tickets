<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Attachment extends Migration
{
    
    public function up()
    {
        /*
        $this->db->disableForeignKeyChecks();

        $this->forge->addField([
            'id'        => ['type' => 'int', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'ticket_id' => ['type' => 'int', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => false],
            'file_name' => ['type' => 'varchar', 'constraint' => 255]
        ]);

        $this->forge->addKey('id', true);
        // $this->forge->addForeignKey('ticket_id', 'tickets', 'id', 'SET_NULL', 'SET_NULL');
        $this->forge->addForeignKey('ticket_id', 'tickets', 'id', 'CASCADE', 'CASCADE', 'ticket_id');

        $this->forge->createTable('attachments', true);

        $this->db->enableForeignKeyChecks();
        */
    }

    public function down()
    {
        /*
        $this->forge->dropTable('attachments', true);
        */
    }
    
    
}
