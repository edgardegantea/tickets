<?= $this->extend('admin/template/admin_template'); ?>

<?= $this->section('content'); ?>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.min.css">
<!-- Mostrar mensaje SweetAlert2 de éxito si existe -->
<?php if(session()->getFlashdata('success')): ?>
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Éxito',
            text: '<?php echo session()->getFlashdata('success'); ?>',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'Aceptar'
        });
    </script>
<?php endif; ?>

<!-- Mostrar mensaje SweetAlert2 de error si existe -->
<?php if(session()->getFlashdata('error')): ?>
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: '<?php echo session()->getFlashdata('error'); ?>',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'Aceptar'
        });
    </script>
<?php endif; ?>

<div>
    <div class="card">
        <div class="card-header">
            <a href="<?= base_url('admin/usuarios/new') ?>" class="btn btn-primary float-right">Nuevo</a>
            <p class="card-title">    <?= esc($title); ?></p>
        </div>

        <div class="card-body">
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Área</th>
                        <th>Nombre</th>
                        <th>Correo electrónico</th>
                        <th>Teléfono</th>
                        <th>Rol</th>
                        <th>Acciones</th>
                    </tr>
                </thead>

                <tbody>
                <?php if (!empty($usuarios) && is_array($usuarios)): ?>
                    <?php foreach ($usuarios as $usuario): ?>
                        <tr>
                            <td>
                                <?= esc($usuario->id); ?>
                            </td>

                            <td>
                                <?= esc($usuario->area); ?>
                            </td>

                            <td>
                                <?= esc($usuario->name); ?>
                                <?= esc($usuario->apaterno); ?>
                                <?= esc($usuario->amaterno); ?>
                            </td>

                            <td>
                                <?= esc($usuario->email) ?>
                            </td>

                            <td>
                                <?= esc($usuario->phone_no) ?>
                            </td>

                            <td>
                                <?php
                                    if ($usuario->role == 'admin') {
                                        echo '<p class="badge bg-primary">Administrador</p>';
                                    } else {
                                        echo '<p class="badge bg-secondary">Usuario</p>';
                                    }
                                    ?>
                            </td>
                            <td class="d-flex">
                                <a href="<?= base_url('/admin/usuarios/'.$usuario->id); ?>" class="btn btn-sm btn-light mx-1" title="Ver"><span class="fas fa-eye"><span></a>
                                <a href="<?= base_url('/admin/usuarios/'.$usuario->id.'/edit'); ?>" class="btn btn-sm btn-light mx-1"><span class="fas fa-edit"><span></a>
                                <a href="<?= site_url('/admin/usuarios/delete/' . $usuario->id) ?>" onclick="return confirm('¿Estás seguro de eliminar este registro?')">Eliminar</a>
                                <!--
                                <form class="display-none" method="post" action="<?= base_url('admin/usuarios/'.$usuario->id); ?>" id="postDeleteForm<?=$usuario->id?>">
                                    <input type="hidden" name="_method" value="DELETE"/>
                                    <a href="javascript:void(0)" onclick="deletePost('postDeleteForm<?=$usuario->id; ?>')" class="btn btn-sm btn-danger" title="Eliminar registro"><span class="fas fa-trash"></span></a>
                                </form>
                                -->
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php endif; ?>

                </tbody>

                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Área</th>
                        <th>Nombre</th>
                        <th>Correo electrónico</th>
                        <th>Teléfono</th>
                        <th>Rol</th>
                        <th>Acciones</th>
                    </tr>
                </tfoot>
            </table>
        </div>

    </div>
</div>

<script>
    function deletePost(formId) {
        var confirm = window.confirm('Esta operación no se puede revertir. ¿Desea continuar?');
        if(confirm == true) {
            document.getElementById(formId).submit();
        }
    }
</script>


<script src="<?= base_url('assets/js/sweetalert2.all.min.js') ?>"></script>

<?= $this->endSection(); ?>

<?= $this->include('admin/template/css'); ?>
<?= $this->include('admin/template/js'); ?>







