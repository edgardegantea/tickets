<?= $this->extend('usuario/template/admin_template'); ?>



<?= $this->section('content'); ?>

<div>
    <div class="card">
        <div class="card-header">
            <a href="<?= base_url('usuario/tickets/new') ?>" class="btn btn-primary float-right">Nuevo</a>
            <h3 class="card-title"><?= esc($title); ?></h3>
        </div>


        <div class="card-body">
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Remitente</th>
                    <th>Título y Descripción</th>
                </tr>
                </thead>

                <tbody>
                <?php if (!empty($tickets) && is_array($tickets)): ?>
                    <?php foreach ($tickets as $ticket): ?>

                        <td>
                            <?= $ticket->id
                             ?>
                        </td>

                        <td>
                            <?= esc($ticket->name . ' ' . $ticket->apaterno . ' ' . $ticket->amaterno); ?>
                            <p class="text-xs text-muted text-uppercase"><?= esc($ticket->nombrearea); ?></p>
                        </td>

                        <!--<td>
                            <?= esc($ticket->nombrearea); ?>
                        </td>-->
                        
                        <td>
                            <p>
                            <?php if ($ticket->estado == "No iniciado" ) : ?>
                                <span class="badge bg-danger text-uppercase"><?= esc($ticket->estado); ?></span>
                            <?php elseif ($ticket->estado == "Iniciado" ) : ?>
                                <span class="badge bg-info text-uppercase"><?= esc($ticket->estado); ?></span>
                            <?php elseif ($ticket->estado == "Finalizado" ) : ?>
                                <span class="badge bg-success text-uppercase"><?= esc($ticket->estado); ?></span>
                            <?php elseif ($ticket->estado == "Cerrado" ) : ?>
                                <span class="badge bg-secondary text-uppercase"><?= esc($ticket->estado); ?></span>
                            <?php else : ?>
                                <span class="badge bg-info text-uppercase"><?= esc($ticket->estado); ?></span>
                            <?php endif; ?>

                                <a href="<?= base_url('/usuario/tickets/'.$ticket->id) ?>" class="text" title="Ver"><?= esc($ticket->title) ?> (<?= esc($ticket->created_at); ?>)</a></p>
                            <p class="text-justify font-weight-light recortartexto"><?= esc($ticket->description) ?></p>

                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">


                                <div class="">
                                <form class="" method="post" action="<?= base_url('/usuario/tickets/'.$ticket->id)?>" id="ticketDeleteForm<?=$ticket->id?>">
                                    <input type="hidden" name="_method" value="DELETE"/>
                                    <a href="javascript:void(0)" onclick="deleteTicket('ticketDeleteForm<?=$ticket->id?>')" class="btn btn-sm btn-danger text-white" title="Eliminar registro">ELIMINAR TICKET</a>
                                </form>
                                </div>
                            </div>
                        </td>

                        </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
                </tbody>
                <tfoot>
                <tr>
                    <th>ID</th>
                    <th>Remitente</th>
                    <th>Título y Descripción</th>
                </tr>
                </tfoot>
            </table>
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

<?= $this->include('admin/template/css'); ?>
<?= $this->include('admin/template/js'); ?>