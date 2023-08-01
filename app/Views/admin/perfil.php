<?= $this->extend("admin/template/admin_template") ?>

<?= $this->section("content") ?>

    <div class="container" style="margin-top:20px;">
        <section class="section">
            <div class="card">
                <div class="card-header">
                    <div class="card-img">
                        <?php /*if ($usuario['image']): */?><!--
                            <img src="<?php /*echo base_url('uploads/' . $usuario['image']); */?>" width="200"
                                 alt="Imagen de usuario">
                        <?php /*else: */?>
                            Sin imagen
                        --><?php /*endif; */?>
                    </div>

                    <div class="card-title">
                        <?= session()->get('name') ?>
                        <?= session()->get('apaterno') ?>
                        <?= session()->get('amaterno') ?>

                    </div>
                </div>
                <div class="card-body">
                    <div class="card-text">
                        Usted es un
                        <?php if (session()->get('role') == "admin") { ?>
                            <?php echo 'Administrador' ?>
                        <?php } ?> del sistema.
                    </div>


                    <div class="card-text">
                        Tu número de teléfono: <?= session()->get('phone_no'); ?>
                    </div>

                    <div class="card-text">
                        Tu correo electrónico: <?= session()->get('email'); ?>
                    </div>
                </div>

                <div class="card-footer">
                    <a href="<?= base_url('/admin/usuarios/' . session()->get('id') . '/editpwd'); ?>"
                       class="btn btn-sm btn-light mx-1">Cambiar contraseña</a>
                </div>
            </div>


            <div class="card">
                <div class="card-text">

                </div>
                <div class="card-body">
                    <div class="card-text">
                        Usted tiene <?= esc($totalTickets) ?> tickets.
                        <a href="<?= base_url('/admin/usuarios/' . session()->get('id') . '/editpwd'); ?>"
                           class="btn btn-sm btn-light mx-1"><span class="fas fa-edit"><span></a>
                    </div>
                </div>
            </div>

        </section>


        <section class="text-center">
            <div class="row">
                <div class="col">
                    <div class="card bg-danger">
                        <div class="card-text">

                        </div>
                        <div class="card-body">
                            <div class="card-text">
                                <?= esc($ticketsAtendidos) ?> tickets sin solucionar
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card bg-warning">
                        <div class="card-text">

                        </div>
                        <div class="card-body">
                            <div class="card-text">
                                <?= esc($ticketsAtendidos) ?> tickets en espera
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card bg-success">
                        <div class="card-text">

                        </div>
                        <div class="card-body">
                            <div class="card-text">
                                <?= esc($ticketsAtendidos) ?> tickets resueltos
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col">
                    <div class="card bg-dark">
                        <div class="card-text">

                        </div>
                        <div class="card-body">
                            <div class="card-text">
                                Usted tiene <?= esc($ticketsAtendidos) ?> tickets atendidos.
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card bg-dark">
                        <div class="card-text">

                        </div>
                        <div class="card-body">
                            <div class="card-text">
                                <?= esc($ticketsAtendidos) ?> tickets cerrados
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card bg-dark">
                        <div class="card-text">

                        </div>
                        <div class="card-body">
                            <div class="card-text">
                                <?= esc($ticketsAtendidos) ?> tickets satisfactorios
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>


    </div>

<?= $this->endSection() ?>