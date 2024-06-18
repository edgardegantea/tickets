<?= $this->extend('admin/template/admin_template'); ?>

<?php
echo '<a class="button is-outlined is-light" href="' . $_SERVER['HTTP_REFERER'] . '">Regresar</a>';
?>

<?= $this->section('content'); ?>

    <h1>Añadir respuesta</h1>

    <form action="<?= base_url('admin/tickets/mensajes'); ?>" method="post" enctype="multipart/form-data">

        <input type="hidden" name="ticket_id" value="<?= $ticketId; ?>">

        <div class="form-group col-12">
            <label for="content">Contenido</label>
            <textarea class="form-control" name="mensaje" id="content" required></textarea>
        </div>

        <!--
        <div class="row">
            <div class="form-group col">
                
                <label for="attachments">Archivos adjuntos:</label>
                <input type="file" name="attachments[]" id="attachments" multiple>
            </div>
        </div>
-->

        <div>
            <button class="btn btn-danger float-right">Cancelar</button>
            <button class="btn btn-primary float-right" type="submit">Guardar</button>
        </div>
    </form>


<?= $this->endSection(); ?>

<?= $this->include('admin/template/css'); ?>
<?= $this->include('admin/template/js'); ?>