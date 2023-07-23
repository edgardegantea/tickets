<?= $this->extend('admin/template/admin_template'); ?>

<?= $this->section('content'); ?>

<div>
    <div class="card">
        <div class="card-header">
            <a href="<?= base_url('admin/categorias/new') ?>" class="btn btn-primary float-right">Nuevo</a>
            <p class="card-title">    <?= esc($title); ?></p>
        </div>

        <div class="card-body">
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Área</th>
                        <th>Detalles</th>
                        <th>Correo electrónico</th>
                        <th>Acciones</th>
                    </tr>
                </thead>

                <tbody>
                <?php if (!empty($categorias) && is_array($categorias)): ?>
                    <?php foreach ($categorias as $categoria): ?>
                        <tr>
                            <td><?= esc($categoria['id']); ?></td>
                            <td><?= esc($categoria['name']); ?></td>
                            <td><?= esc($categoria['slug']); ?></td>
                            <td><?= esc($categoria['description']) ?></td>
                            <td class="d-flex">
                                <a href="<?= base_url('/admin/categorias/'.$categoria['id']); ?>" class="btn btn-sm btn-light mx-1" title="Ver"><span class="fas fa-eye"><span></a>
                                <a href="<?= base_url('/admin/categorias/'.$categoria['id'].'/edit'); ?>" class="btn btn-sm btn-light mx-1"><span class="fas fa-edit"><span></a>
                                <form class="display-none" method="post" action="<?= base_url('admin/categorias/'.$categoria['id']); ?>" id="categoriaDeleteForm<?=$categoria['id']?>">
                                    <input type="hidden" name="_method" value="DELETE"/>
                                    <a href="javascript:void(0)" onclick="deleteCategoria('categoriaDeleteForm<?=$categoria['id']; ?>')" class="btn btn-sm btn-danger" title="Eliminar registro"><span class="fas fa-trash"></span></a>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php endif; ?>

                </tbody>

                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Área</th>
                        <th>Detalles</th>
                        <th>Correo electrónico</th>
                        <th>Acciones</th>
                    </tr>
                </tfoot>
            </table>
        </div>

    </div>
</div>

<script>
    function deleteCategoria(formId) {
        var confirm = window.confirm('Esta operación no se puede revertir. ¿Desea continuar?');
        if(confirm == true) {
            document.getElementById(formId).submit();
        }
    }
</script>


<?= $this->endSection(); ?>

<?= $this->include('admin/template/css'); ?>
<?= $this->include('admin/template/js'); ?>







