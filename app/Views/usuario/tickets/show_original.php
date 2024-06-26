<?= $this->extend('usuario/template/admin_template'); ?>

<?php
echo '<a class="button is-outlined is-light" href="' . $_SERVER['HTTP_REFERER'] . '">Regresar</a>';
?>

<?= $this->section('content'); ?>

<div>
    <div class="card">
        <div class="card-header bg-dark">
            <h3 class="card-title"><?= esc($title); ?></h3>
            <a class="btn btn-secondary float-right" href="<?= site_url('usuario/tickets'); ?>">Regresar</a>
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
                <?php if ($ticket['evidence']): ?>
                    <p>Archivo adjunto: 
                        <a href="<?= base_url('public/uploads/tickets/' . $ticket['evidence']) ?>" download><?= $ticket['evidence'] ?></a>
                    </p>
                <?php endif; ?>
            </div>

        </div>


        <div class="card-header bg-dark mt-5">
            <h3 class="card-title">Mensajes</h3>
            <a class="btn btn-primary float-right" href="<?= site_url('usuario/tickets/' . $ticket['id'] . '/agregarMensaje'); ?>">Responder</a>
        </div>

        <div class="card-body">
        <?php if (empty($mensajes)) : ?>
            <p>No hay mensajes</p>
        <?php else : ?>
            <ul>
                <?php foreach ($mensajes as $mensaje) : ?>         
                    <div class="card">
                        <div class="card-body" style="text-align: justify;">
                            <p>
                                <strong>
                                    
                                </strong>
                                <?= $mensaje->mensaje; ?>
                            </p>
                            <p class="text-muted float-right mb-1">(<?= $mensaje->created_at; ?>)</p>
                        </div>
                    </div>
                    
                <?php endforeach; ?>
            </ul>
        <?php endif; ?>

    </div>
        <div class="card-footer">
            
            <form class="display-none" method="post" action="<?= base_url('/usuario/tickets/'.$ticket['id'] )?>" id="ticketDeleteForm<?= $ticket['id'] ?>">
                <input type="hidden" name="_method" value="DELETE"/>
                <a 
                href="javascript:void(0)" 
                onclick="deleteTicket('ticketDeleteForm<?= $ticket['id']; ?>)"
                class="btn btn-sm btn-danger  float-right"
                title="Eliminar registro">
                <span class="fas fa-trash">
                </span>
            Eliminar
        </a>
            </form>

            
        </div>
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