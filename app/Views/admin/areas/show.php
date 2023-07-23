<?= $this->extend('admin/template/admin_template'); ?>

<?= $this->section('content'); ?>


    <div class="card card-secondary">
        <div class="card-header">
            <h3 class="card-title"><?= esc($title); ?></h3>
            <a href="<?= base_url('admin/areas') ?>" class="btn btn-dark float-right">Regresar</a>
        </div>
        
        <div class="card-body">
            <h4 class="card-title"><?= esc($area['name']); ?></h4>
            <p class="card-text mt-2"><?= esc($area['description']); ?></p>
            <hr>
            <div class="row">
                <div class="col-md-6">
                    <p class="card-text">Correo electrónico: <?= esc($area['email']); ?></p>        
                </div>
                <div class="col-md-6">
                    <p class="card-text">Teléfono: <?= esc($area['phone']); ?></p>        
                </div>
            </div>
            
        </div>

        <div class="card-footer">
            <a href="<?= base_url('/admin/areas/'.$area['id'].'/edit') ?>" class="btn btn-primary float-right">Editar</a>
        </div>

    </div>


<?= $this->endsection(); ?>