<?= $this->extend('admin/template/admin_template'); ?>



<?= $this->section('content'); ?>

<div>
    <div class="card">
        <div class="card-header">
            <a href="<?= base_url('admin/tickets/new') ?>" class="btn btn-primary float-right">Nuevo</a>
            <h3 class="card-title"><?= esc($title); ?></h3>
        <a href="<?= base_url('admin/tickets') ?>" class="btn btn-light mr-2 float-right">Vista de tabla</a>
            <h3 class="card-title"><?= esc($title); ?></h3>
            
        </div>

        <div class="card-body">

                <?php if (!empty($tickets) && is_array($tickets)): ?>
                    <?php foreach ($tickets as $ticket): ?>

                        <div class="row">
                            <div class="col-md-1 text-right">
                                <p class="font-monospace fst-italic">
                            <?= $ticket->id ?>
                    </p>
                            </div>    
                            <div class="col-md-2">
                            <?= "\t" . $ticket->created_at ?>
                    </div>
                            <div class="col-md-9">
                                <strong><a href="<?= base_url('/admin/tickets/'.$ticket->id) ?>" class="text" title="Ver"><?= esc($ticket->title) ?></a></strong>
                            </p>
                    </div>
                        </div>

                    <?php endforeach; ?>
                <?php endif; ?>
               
        </div>

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

<?= $this->include('admin/template/css'); ?>
<?= $this->include('admin/template/js'); ?>







