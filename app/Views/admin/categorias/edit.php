<?= $this->extend('admin/template/admin_template'); ?>

<?= $this->section('content'); ?>


    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title"><?= esc('title') ?></h3>
        </div>

        <?php $validation = \Config\Services::validation(); ?>

            <div class="card-body">
                <h4>Información básica del área</h4>

                <form action="<?= base_url('admin/areas/'.$area['id']) ?>" method="POST">

                <?= csrf_field() ?>
                
                <input type="hidden" name="_method" value="PUT" />


                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="exampleInputBorderWidth2">Área:</label>
                            <input type="text" class="form-control 
                            <?php if($validation->getError('name')): ?>is-invalid<?php endif ?>"
                            id="exampleInputBorderWidth2" name="name" 
                            value="<?php if($area['name']): echo $area['name']; else: set_value('name'); endif ?>"/>
                            
                            <?php if ($validation->getError('name')): ?>
                                <div class="invalid-feedback">
                                    <?= $validation->getError('name') ?>
                                </div>                                
                            <?php endif; ?>
                        </div>
                    </div>


                    <div class="col">
                        <div class="form-group">
                            <label for="exampleInputBorderWidth2">Correo electrónico:</label>
                            <input type="email" class="form-control
                            <?php if($validation->getError('email')): ?>is-invalid<?php endif ?>"
                            id="exampleInputBorderWidth2" name="email" 
                            value="<?php if($area['email']): echo $area['email']; else: set_value('email'); endif ?>"/>
                            
                            <?php if ($validation->getError('email')): ?>
                                <div class="invalid-feedback">
                                    <?= $validation->getError('email') ?>
                                </div>                                
                            <?php endif; ?>
                        </div>
                    </div>

                    <div class="col">
                        <div class="form-group">
                            <label for="exampleInputBorderWidth2">Teléfono:</label>
                            <input type="tel" class="form-control
                            <?php if($validation->getError('phone')): ?>is-invalid<?php endif ?>"
                            id="exampleInputBorderWidth2" name="phone" 
                            value="<?php if($area['phone']): echo $area['phone']; else: set_value('phone'); endif ?>"/>
                            
                            <?php if ($validation->getError('phone')): ?>
                                <div class="invalid-feedback">
                                    <?= $validation->getError('phone') ?>
                                </div>                                
                            <?php endif; ?>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="exampleInputBorderWidth2">Detalles:</label>
                            <textarea class="form-control" name="description" id="" cols="30" rows="3"><?php echo $area['description']; ?></textarea>
                            <?php if ($validation->getError('description')): ?>
                                <div class="invalid-feedback">
                                    <?= $validation->getError('description') ?>
                                </div>                                
                            <?php endif; ?>
                        </div>
                    </div>
                </div>

            </div>

            <div class="card-footer">
                <button type="reset" class="btn btn-default">Restablecer campos</button>
                <button type="submit" class="btn btn-primary float-right">Aceptar</button>
            </div>


        </form>

    </div>


<?= $this->endsection(); ?>