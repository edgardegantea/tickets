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


        <?php if (isset($validation)) : ?>
            <div class="">
                <div class="alert alert-danger" role="alert">
                    <p><?= $validation->listErrors() ?></p>
                </div>
            </div>
        <?php endif; ?>


        <form class="" action="<?= base_url('login'); ?>" method="post">

            <!-- <img class="mb-4" src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">-->

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

            <!-- 
    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Recordarme
      </label>
    </div>
-->

            <button class="w-100 btn btn-lg btn-primary" type="submit">Ingresar</button>

        </form>
    </main>



</body>

</html>