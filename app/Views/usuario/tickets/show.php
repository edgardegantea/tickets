<?= $this->extend('usuario/template/admin_template'); ?>

<?php
echo '<a class="button is-outlined is-light" href="' . $_SERVER['HTTP_REFERER'] . '">Regresar</a>';
?>

<?= $this->section('content'); ?>

<div>

    <div class="row">
        <div class="col-md-8">

            <div class="card">
                <div class="card-header bg-dark">
                    <h3 class="card-title"><?= esc($title); ?></h3>
                    <a class="btn btn-sm btn-secondary float-right"
                        href="<?= site_url('usuario/tickets'); ?>">Regresar</a>
                    <form class="display-none" method="post"
                        action="<?= base_url('/usuario/tickets/' . $ticket['id']) ?>"
                        id="ticketDeleteForm<?= $ticket['id'] ?>">
                        <input type="hidden" name="_method" value="DELETE" />
                        <a href="javascript:void(0)" onclick="deleteTicket('ticketDeleteForm<?= $ticket['id'] ?>')"
                            class="btn btn-sm btn-danger float-right mr-2" title="Eliminar registro"><span
                                class="fas fa-trash"></span> Eliminar</a>
                    </form>
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
                        <?php if (!empty($attachments)): ?>
                            <h2>Archivos Adjuntos</h2>
                            <div class="">
                                <?php foreach ($attachments as $attachment): ?>
                                    <ul style="list-style-type: none">
                                        <li class="mb-1">
                                            <a class="btn btn-sm btn-light"
                                               href="<?= base_url('uploads/' . $attachment['file_name']); ?>"
                                               target="_blank"><?php if ($attachment['file_name']): ?>
                                                    <p><?= $attachment['file_name'] ?></p>
                                                <?php endif; ?></a>


                                        </li>
                                    </ul>
                                <?php endforeach; ?>
                            </div>
                        <?php endif; ?>
                    </div>

                </div>
            </div>

        </div>



        <div class="col-md-4">
            <div class="card card-dark direct-chat direct-chat-primary">
                <div class="card-header">
                    <h3 class="card-title">Mensajes</h3>
                </div>

                <div class="card-body">
                    <div class="direct-chat-messages">
                        <?php if (empty($mensajes)) : ?>
                            <p>No hay mensajes</p>
                        <?php else : ?>
                            <?php foreach ($mensajes as $mensaje) : ?>
                                <?php if (session()->get('id') != $mensaje['usuario_id']) : ?>
                                    <div class="direct-chat-msg">
                                        <div class="direct-chat-text float-left">
                                            <p><?= $mensaje['created_at']; ?> ::
                                                <strong><?= $mensaje['mensaje'] ?></strong>
                                            </p>
                                        </div>
                                    </div>
                                <?php else: ?>
                                    <div class="direct-chat-msg right">
                                        <div class="direct-chat-text bg-primary float-right">
                                            <p><?= $mensaje['created_at']; ?> ::
                                                <strong><?= $mensaje['mensaje'] ?></strong>
                                            </p>
                                        </div>
                                    </div>
                                <?php endif; ?>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </div>
                </div>

                <div class="card-footer">
                    <form action="<?= base_url('usuario/tickets/mensajes'); ?>" method="post">
                        <div class="input-group">
                            <input type="hidden" name="ticket_id" value="<?= $ticket['id']; ?>">
                            <input type="text" name="mensaje" placeholder="Escribe un mensaje" class="form-control">
                            <span class="input-group-append">
                        <input class="btn btn-dark" type="submit" value="Enviar">
                    </span>
                        </div>
                    </form>
                </div>
            </div>
        </div>



    </div>
</div>






</div>


<script>
function deleteTicket(formId) {
    var confirm = window.confirm('Esta operación no se puede revertir. ¿Desea continuar?');
    if (confirm == true) {
        document.getElementById(formId).submit();
    }
}
</script>








<?= $this->endSection(); ?>