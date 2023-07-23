<?= $this->extend('admin/template/admin_template'); ?>

<?= $this->section('content'); ?>


    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title"><?= esc($title); ?></h3>
        </div>


        <form action="/admin/areas" method="post">

            <div class="card-body">
                <?php csrf_field(); ?>

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="">Área:</label>
                            <input type="text" name="name" class="form-control">
                        </div>
                    </div>

                    <div class="col">
                        <div class="form-group">
                            <label for="">Correo electrónico:</label>
                            <input type="email" name="email" class="form-control">
                        </div>
                    </div>
                
                    <div class="col">
                        <div class="form-group">
                            <label for="">Teléfono:</label>
                            <input name="phone" type="tel" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="">Descripción:</label>
                            <textarea class="form-control" name="description" id="" cols="30" rows="3"></textarea>
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