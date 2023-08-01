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
                        <div class="row">
                            <?php foreach ($attachments as $attachment): ?>
                            <div class="card col-md-3 mr-5">
                                <div class="card-body">
                                    <img src="<?= base_url('uploads/' . $attachment['file_name']); ?>"
                                        alt="<?= $attachment['file_name']; ?>" style="max-width: 200px;">
                                </div>
                                <div class="card-footer">
                                    <a class="btn btn-sm btn-dark"
                                        href="<?= base_url('uploads/' . $attachment['file_name']); ?>"
                                        target="_blank">Descargar</a>
                                </div>
                            </div>
                            <?php endforeach; ?>
                        </div>
                        <?php endif; ?>
                    </div>

                </div>
            </div>

        </div>


        <div class="col-md-4">
            <div class="card">

                <div class="card-header bg-dark">
                    <h3 class="card-title">Mensajes</h3>
                    <a class="btn btn-sm btn-primary float-right"
                        href="<?= base_url('usuario/tickets/' . $ticket['id'] . '/agregarMensaje'); ?>">Responder</a>
                </div>


                <div class="card-body">

                    <!--<div class="d-flex gap-2 justify-content-center pb-4">

                        <form action="<?php /*= base_url('admin/tickets/mensajes'); */ ?>" method="post">
                            <input type="hidden" name="ticket_id" value="<?php /*= $ticket['id']; */ ?>">
                            <textarea class="form-control" name="mensaje" id="" cols="30" rows="3"></textarea>
                            <div class="ml-3 d-flex gap-2 float-right">
                                <button class="btn btn-primary float-right" type="submit">Guardar</button>
                            </div>
                        </form>
                    </div>

                    <div class="section"></div>-->


                    <div class="mt-5">

                        <?php if (empty($mensajes)) : ?>
                        <p>No hay mensajes</p>
                        <?php else : ?>
                        <ul>
                            <?php foreach ($mensajes

                            as $mensaje) : ?>

                            <?php if (session()->get('id') == $mensaje['usuario_id']) : ?>
                            <div class="card bg-dark">
                                <div class="card-body" style="text-align: end;">
                                    <p class="text-bold"><?= $mensaje['mensaje']; ?></p>
                                    <p class="text-sm float-right mb-0">(<?= $mensaje['created_at']; ?>)</p>
                                </div>
                            </div>

                            <?php else: ?>

                            <div class="card">

                                <?php if (!empty($adjuntosMensaje)): ?>
                                <?php foreach ($adjuntosMensaje as $am): ?>
                                <?= $am->mensaje ?>
                                <?php endforeach; ?>
                                <?php endif; ?>


                                <div class="card-body" style="text-align: justify;">
                                    <p class="text-bold"><?= $mensaje['mensaje']; ?></p>
                                    <p class="text-sm mb-1">(<?= $mensaje['created_at']; ?>)</p>

                                    <br>

                                </div>


                            </div>

                            <?php endif; ?>
                            <?php endforeach; ?>
                        </ul>
                        <?php endif; ?>
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