<?= $this->extend('usuario/template/admin_template'); ?>

<?= $this->section('content'); ?>
<section class="section">

    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title"><?= esc($title); ?></h3>
        </div>


        <?php $validation = \Config\Services::validation(); ?>
        <?php $session = \Config\Services::session(); ?>

        <!-- <form action="/admin/tickets" method="post" enctype="multipart/form-data"> -->
        <form action="<?= base_url('/usuario/tickets'); ?>" method="post" enctype="multipart/form-data">

            <div class="card-body">

                <?= csrf_field(); ?>

                <div class="row">
                    <div class="form-group col-12">
                        <label>Asunto:</label>
                        <input
                            class="form-control <?php if ($validation->getError('title')): ?>is-invalid<?php endif; ?>"
                            required type="text" name="title" style="font-size: x-large;"
                            value="<?php echo set_value('title'); ?>">
                        <?php if ($validation->getError('title')): ?>
                        <div class="invalid-feedback">
                            <?= $validation->getError('title'); ?>
                        </div>
                        <?php endif; ?>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 form-group">
                        <label class="label">Categoría:</label>
                        <select class="form-control" required name="category">
                            <option disabled selected>Seleccione la categoría:</option>
                            <?php foreach ($categories as $c): ?>
                            <option value="<?= $c['id'] ?>"><?= $c['name'] ?><?php echo set_value('name'); ?></option>
                            <?php endforeach ?>
                        </select>
                    </div>

                    <div class="col-md-6 form-group">
                        <label class="label">Prioridad:</label>
                        <select class="form-control" required name="priority">
                            <option disabled selected>Seleccione la prioridad</option>
                            <?php foreach ($priorities as $p): ?>
                            <option value="<?= $p['id'] ?>"><?= $p['name'] ?></option>
                            <?php endforeach ?>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col">
                        <label class="label">Descripción de la falla o situación:</label>
                        <textarea required
                            class="form-control <?php if ($validation->getError('description')): ?>is-invalid<?php endif; ?>"
                            name="description"></textarea>

                        <?php if ($validation->getError('description')): ?>
                        <div class="invalid-feedback">
                            <?= $validation->getError('description'); ?>
                        </div>
                        <?php endif; ?>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col">
                        <!-- Input para subir archivos adjuntos (pueden ser múltiples) -->
                        <label for="attachments">Archivos adjuntos:</label>
                        <input type="file" name="attachments[]" id="attachments" multiple>
                    </div>
                </div>


                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label class="label">URL:</label>
                            <input class="form-control" type="url" name="url">
                        </div>
                    </div>

                </div>


                <div class="card-footer">
                    <input class="btn btn-default" type="reset">
                    <input class="btn btn-primary float-right" type="submit" name="" value="Enviar">
                </div>


        </form>

</section>


<?= $this->endSection() ?>