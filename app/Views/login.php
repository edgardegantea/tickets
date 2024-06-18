<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Iniciar sesión</title>

    <link rel="stylesheet" href="<?php echo base_url('assets/css/bootstrap.min.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url('assets/css/signin.css'); ?>">
    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#712cf9">


    <style>

        .btn {
            border-radius: 0px;
        }

        input select text-area {
            border-radius: 0px;
        }

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

</head>

<body class="text-center">


<main class="form-signin w-100 m-auto">


    <?php if (session()->getFlashdata('error')): ?>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <?= session()->getFlashdata('error') ?>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    <?php endif; ?>


    <?php if (session()->getFlashdata('success')): ?>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <?= session()->getFlashdata('success') ?>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    <?php endif; ?>


    <form class="" action="<?= base_url('login'); ?>" method="post">

        <p class="text-uppercase text-muted" style=" font-size: 12px;">Instituto Tecnológico Superior de Teziutlán</p>
        <p class="badge text-uppercase text-muted" style="color: navy;">Ingeniería Informática</p>
        <h2 class="mb-5">Tickets de soporte</h2>

        <!-- <h1 class="h3 mb-3 fw-normal">Iniciar sesión</h1> -->

        <div class="form-floating">
            <input type="email" name="email" class="form-control" id="floatingInput"
                   placeholder="correo electrónico">
            <label for="floatingInput">Correo electrónico</label>
        </div>
        <div class="form-floating">
            <input type="password" name="password" class="form-control" id="floatingPassword"
                   placeholder="Contraseña">
            <label for="floatingPassword">Contraseña</label>
        </div>

        <button class="w-100 btn btn-lg btn-primary" type="submit">Ingresar</button>

        <br><br>
        <a class="btn btn-danger" href="<?= base_url('/password/request-reset'); ?>">Olvidé mi contraseña</a>

        <?php
        $numero_whatsapp = '+522312051120';
        ?>

        <div class="mt-5 text-muted">
            En caso de presentar complicaciones para iniciar sesión, póngase en contacto con el desarrollador del sistema
            <br>
            <a target="_blank" class="btn btn-info" href="https://api.whatsapp.com/send?phone=<?php echo $numero_whatsapp; ?>&text=STickets-ITST" class="whatsapp-button">
                <i class="fab fa-whatsapp whatsapp-icon"></i> CONTACTAR
            </a>
        </div>

    </form>


    <section class="mt-5">
        <p>Si no tienes una cuenta </p><h4><a href="/registro"><span class="badge bg-primary">Regístrate aquí</span></a></h4>
    </section>
</main>





<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<script>
    $(document).ready(function() {
        setTimeout(function() {
            $(".alert").alert('close');
        }, 5000);
    });
</script>
</body>

</html>