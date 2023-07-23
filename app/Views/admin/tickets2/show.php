<?= $this->extend('admin/template/admin_template'); ?>

<?php
echo '<a class="button is-outlined is-light" href="' . $_SERVER['HTTP_REFERER'] . '">Regresar</a>';
?>

<?= $this->section('content'); ?>

<div>
    <div class="card">
        <div class="card-header">
            <h3 class="card-title"><?= esc($title); ?></h3>
        </div>

        <div class="card-body">

            <div>
                <label for="">Asunto:</label>
                <h1><?= esc($ticket['title']); ?></h1>
            </div>

            <div class="mt-5">
                <label for="">Descripción del ticket:</label>
                <p><?= esc($ticket['description']); ?></p>
            </div>

            
            <div class="mt-5">
                Evidencia:
            </div>


            <div class="mt-5 card-text">
                <div class="">
                    <a class="btn btn-primary" href="<?= base_url('admin/tickets2/enviarEmail') ?>">
                    <i class="fas fa-envelope"></i>
                    Enviar email</a>
                </div>    
            </div>

            

            <div class="mt-2">
                <a target="_blank" aria-label="Chat WhatsApp" href="https://wa.me/52<?= esc($ticket['phone']); ?>"><i class="fas fa-phone"></i> Enviar mensaje por WhatsApp</a>
            </div>

        </div>

        <div class="card-footer float-right">
            
            <form class="display-none" method="post" action="<?= base_url('/admin/tickets2/'.$ticket['id'])?>" id="ticketDeleteForm<?=$ticket['id']?>">
                <input type="hidden" name="_method" value="DELETE"/>
                <a href="javascript:void(0)" onclick="deleteTicket('ticketDeleteForm<?=$ticket['id']?>')" class="btn btn-sm btn-danger" title="Eliminar registro"><span class="fas fa-trash"></span> Eliminar</a>
            </form>

            
        </div>


        <div class="mt-5 card-body">
            <h2>Mensajes</h2>

            <?php if (empty($mensajes)) : ?>
                <p>No hay mensajes</p>
            <?php else : ?>
                <ul>
                    <?php foreach ($mensajes as $mensaje) : ?>
                        <li><?= $mensaje['mensaje']; ?> (<?= $mensaje['created_at']; ?>)</li>
                    <?php endforeach; ?>
                </ul>
            <?php endif; ?>

            <a href="/admin/tickets2/<?= $ticket['id']; ?>/add-comment">Responder</a>
        </div>


            <script>
                function deleteTicket(formId) {
                    var confirm = window.confirm('Esta operación no se puede revertir. ¿Desea continuar?');
                    if(confirm == true) {
                        document.getElementById(formId).submit();
                    }
                }
            </script>


            <?= $this->endSection(); ?>
