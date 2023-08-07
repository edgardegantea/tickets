<!doctype html>
<html lang="en" class="h-100">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sistema de tickets de soporte</title>

    <link rel="stylesheet" href="<?php echo base_url('assets/css/bootstrap.min.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url('assets/css/cover.css'); ?>">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#712cf9">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="cover.css" rel="stylesheet">
</head>
<body class="d-flex h-100 text-bg-dark">

<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">

    <header class="mb-auto"></header>
    <main class="mb-auto">
        <h1>Sistema de tickets de soporte</h1>

        <div class="">
            <form action="<?= base_url('/registro') ?>" method="post" enctype="multipart/form-data">

                <div class="card-body">
                    <h4>Información básica del usuario</h4>


                    <?php csrf_field(); ?>


                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputBorderWidth2">Nombre:</label>
                                <input type="text" class="form-control"
                                       id="exampleInputBorderWidth2" name="name" placeholder="Ejemplo: Edgar">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputBorderWidth2">Apellido Paterno:</label>
                                <input type="text" class="form-control"
                                       id="exampleInputBorderWidth2" name="apaterno" placeholder="Ejemplo: Degante">
                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputBorderWidth2">Apellido Materno:</label>
                                <input type="text" class="form-control"
                                       id="exampleInputBorderWidth2" name="amaterno" placeholder="Ejemplo: Aguilar"
                                       minlength="3">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputBorderWidth2">Correo electrónico:</label>
                                <input type="email" class="form-control"
                                       id="exampleInputBorderWidth2" name="email" placeholder="Correo electrónico">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputBorderWidth2">Contraseña:</label>
                                <input type="password" class="form-control"
                                       id="exampleInputBorderWidth2" name="password"
                                       placeholder="Defina una contraseña">
                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="">Teléfono:</label>
                                <input class="form-control" type="tel" name="phone_no" pattern="[0-9]{10}">
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleSelectBorderWidth2">Área de adscripción:</label>
                                <select name="area" class="form-select"
                                        id="exampleSelectBorderWidth2">
                                    <?php foreach ($areas as $area): ?>
                                        <option value="<?= $area['id'] ?>"><?= $area['name'] ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleSelectBorderWidth2">Perfil:</label>
                                <input class="form-control" type="text" disabled name="" value="Usuario">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleSelectBorderWidth2">Foto de perfil (OPCIONAL):</label>
                                <input class="form-file" type="file" name="image" accept="image/*" id="" class="">
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

    </main>

    <footer class="mt-auto text-white-50">
        <p>edgarDeganteA</p>
    </footer>
</div>


</body>
</html>