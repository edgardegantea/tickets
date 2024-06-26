<!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<?php echo base_url('/'); ?>" class="brand-link">

     <!--  <img src="<?php echo base_url('assets/dist/img/AdminLTELogo.png'); ?>" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> -->
      <span class="brand-text font-weight-light">Tickets de soporte</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <!-- <div class="image">
          <img src="<?php echo base_url('assets/dist/img/user2-160x160.jpg'); ?>" class="img-circle elevation-2" alt="User Image">
        </div> -->
        <div class="info">
          <a href="#" class="d-block"><?= session()->get('name') ?></a>
        </div>
      </div>

      <!-- SidebarSearch Form -->

      <!-- 
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>
    -->

      
    <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon classwith font-awesome or any other icon font library -->

                <!--
                <li class="nav-item menu-open">
                    <a href="#" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>
-->

                <!--
                <li class="nav-item">
                    <a href="<?php echo base_url('usuario/usuarios'); ?>" class="nav-link">
                        <i class="nav-icon fas fa-users"></i>
                        <p>
                            Usuarios
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo base_url('usuario/usuarios/new'); ?>" class="nav-link">
                                <i class="fas fa-plus nav-icon"></i>
                                <p>Nuevo usuario</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('usuario/usuarios'); ?>" class="nav-link">
                                <i class="fas fa-user nav-icon"></i>
                                <p>Todos los usuarios</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="pages/layout/top-nav.html" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Atendidos</p>
                            </a>
                        </li>
                    </ul>
                </li>
                -->


                <li class="nav-item">
                    <a href="<?php echo base_url('usuario/tickets'); ?>" class="nav-link">
                        <i class="nav-icon fas fa-copy"></i>
                        <p>
                            Mis tickets
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo base_url('usuario/tickets/new'); ?>" class="nav-link">
                                <i class="fas fa-plus nav-icon"></i>
                                <p>Nuevo ticket</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('usuario/tickets'); ?>" class="nav-link">
                                <i class="fas fa-user nav-icon"></i>
                                <p>Todos los tickets</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Atendidos</p>
                            </a>
                        </li>
                    </ul>
                </li>



                <!--
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-chart-pie"></i>
                        <p>
                            Charts
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="pages/charts/uplot.html" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>uPlot</p>
                            </a>
                        </li>
                    </ul>
                </li>
                -->


                <!--
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-copy"></i>
                        <p>
                            Mis tickets
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                </li>
-->

            </ul>
        </nav>
        <!-- /.sidebar-menu -->


    </div>
    <!-- /.sidebar -->
  </aside>