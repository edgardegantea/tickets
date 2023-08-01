<?= $this->extend('admin/template/admin_template'); ?>

<!-- <?php
echo '<a class="button is-outlined is-light" href="' . $_SERVER['HTTP_REFERER'] . '">Regresar</a>';
?> -->

<?= $this->section('content'); ?>
<div>
    <div class="row">
        <div class="col-md-8">

            <div class="card">
                <div class="card-header bg-dark">
                    <h3 class="card-title"><?= esc($title); ?></h3>
                    <a class="btn btn-sm btn-secondary float-right"
                        href="<?= site_url('admin/tickets'); ?>">Regresar</a>
                        <a class="btn btn-sm btn-secondary float-right"
                        href="<?= site_url('admin/tickets/enviarEmail'); ?>">Email</a>
                    <form class="display-none" method="post" action="<?= base_url('/admin/tickets/' . $ticket['id']) ?>"
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



            <div class="card card-dark direct-chat direct-chat-danger">
                <div class="card-header">
                    <h3 class="card-title">Mensajes</h3>
                    <div class="card-tools">
                    </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body">

                    <?php if (empty($mensajes)) : ?>
                    <p>No hay mensajes</p>
                    <?php else : ?>
                    <?php foreach ($mensajes as $mensaje) : ?>

                    
                    <?php if (session()->get('id') != $mensaje['usuario_id']) : ?>
                    <div class="direct-chat-messages">


                    <div class="direct-chat-msg">

                            <div class="direct-chat-infos clearfix">
                                <span class="direct-chat-name"></span>
                                <span class="direct-chat-timestamp float-right"></span>
                            </div>
                            <!-- 
                            <img class="direct-chat-img" src="/docs/3.2/assets/img/user1-128x128.jpg"
                                alt="message user image">
                                -->
                            <div class="direct-chat-text float-right">

                                <p class=""><?= $mensaje['created_at']; ?> ::
                                    <strong><?= $mensaje['mensaje'] ?></strong></p>

                            </div>
                        </div>
                        <?php else: ?>

                        <div class="direct-chat-msg">
                            <div class="direct-chat-infos clearfix">
                                <span class="direct-chat-name float-left"></span>
                                <span class="direct-chat-timestamp float-left"></span>
                            </div>
                            <!--
                            <img class="direct-chat-img" src="/docs/3.2/assets/img/user3-128x128.jpg"
                                alt="message user image">
                                    -->
                            <div class="direct-chat-text float-text float-right">
                                <p class=""><?= $mensaje['created_at']; ?> ::
                                    <strong><?= $mensaje['mensaje'] ?></strong></p>
                            </div>
                        </div>

                        <?php endif; ?>
                        <?php endforeach; ?>


                    </div>

                    <?php endif; ?>

                    <div class="card-footer">
                        <form action="<?= base_url('admin/tickets/mensajes'); ?>" method="post"
                            enctype="multipart/form-data">
                            <div class="input-group">
                                <input type="hidden" name="ticket_id" value="<?= $ticketId; ?>">
                                <input type="text" name="mensaje" placeholder="Escribe un mensaje" class="form-control">
                                <span class="input-group-append">
                                    <input class="btn btn-dark" type="submit" value="Enviar">
                                </span>
                            </div>
                        </form>
                    </div>

                </div>
                <!--/.direct-chat -->

            </div>
                        </div>


            <div class="col-md-4">



                <div class="card">

                    <div class="card-header bg-dark">
                        <h3 class="card-title">Información del ticket</h3>
                        
                    </div>


                    <div class="card-body">
                        <div class="">
                            Fecha: <strong><?= $ticket['created_at'] ?></strong>
                        </div>

                        <div class="">
                            Usuario: <strong><?= $ticket['id'] ?></strong>
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