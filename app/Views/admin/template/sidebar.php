<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<?php echo base_url('/admin/'); ?>" class="brand-link">

        <!-- <img src="<?php echo base_url('assets/dist/img/AdminLTELogo.png'); ?>" alt="AdminLTE Logo"
             class="brand-image img-circle elevation-3" style="opacity: .8"> -->
        <span class="brand-text font-weight-light">Tickets de soporte</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <!-- <div class="image">
                <img src="<?php echo base_url('assets/dist/img/user2-160x160.jpg'); ?>" class="img-circle elevation-2"
                     alt="User Image">
            </div> -->
            <div class="info">
                <a href="#" class="d-block"><?= session()->get('name') ?> <?= session()->get('apaterno') ?> <?= session()->get('amaterno') ?> </a>
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
                <li class="nav-item menu-open">
                    <a href="#" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?php echo base_url('admin/usuarios'); ?>" class="nav-link">
                        <i class="nav-icon fas fa-users"></i>
                        <p>
                            Usuarios
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo base_url('admin/usuarios/new'); ?>" class="nav-link">
                                <i class="fas fa-plus nav-icon"></i>
                                <p>Nuevo usuario</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('admin/usuarios'); ?>" class="nav-link">
                                <i class="fas fa-user nav-icon"></i>
                                <p>Todos los usuarios</p>
                            </a>
                        </li>
                        <!--
                        <li class="nav-item">
                            <a href="pages/layout/top-nav.html" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Atendidos</p>
                            </a>
                        </li>
                    -->
                    </ul>
                </li>


                <li class="nav-item">
                    <a href="<?php echo base_url('admin/areas'); ?>" class="nav-link">
                        <i class="nav-icon fa fa-puzzle-piece"></i>
                        <p>
                            Áreas
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo base_url('admin/areas/new'); ?>" class="nav-link">
                                <i class="fas fa-plus nav-icon"></i>
                                <p>Nueva área</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('admin/areas'); ?>" class="nav-link">
                                <i class="fas fa-user nav-icon"></i>
                                <p>Todas los áreas</p>
                            </a>
                        </li>
                        <!--
                        <li class="nav-item">
                            <a href="pages/layout/top-nav.html" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Atendidos</p>
                            </a>
                        </li>
                    -->
                    </ul>
                </li>

                <li class="nav-item">
                    <a href="<?php echo base_url('admin/areas'); ?>" class="nav-link">
                        <i class="nav-icon fa fa-bars"></i>
                        <p>
                            Categorías
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <!--
                        <li class="nav-item">
                            <a href="<?php echo base_url('admin/categorias/new'); ?>" class="nav-link">
                                <i class="fas fa-plus nav-icon"></i>
                                <p>Nueva categoría</p>
                            </a>
                        </li>
                        -->

                        <li class="nav-item">
                            <a href="<?php echo base_url('admin/categorias'); ?>" class="nav-link">
                                <i class="fas fa-circle nav-icon"></i>
                                <p>Todas las categorías</p>
                            </a>
                        </li>
                        <!--
                        <li class="nav-item">
                            <a href="pages/layout/top-nav.html" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Atendidos</p>
                            </a>
                        </li>
                    -->
                    </ul>
                </li>



                <li class="nav-item">
                    <a href="<?php echo base_url('admin/tickets'); ?>" class="nav-link">
                        <i class="nav-icon fa fa-copy"></i>
                        <p>
                            Tickets de Soporte
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo base_url('admin/tickets/new'); ?>" class="nav-link">
                                <i class="fas fa-plus nav-icon"></i>
                                <p>Nuevo ticket</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('admin/tickets'); ?>" class="nav-link">
                                <i class="fas fa-user nav-icon"></i>
                                <p>Todos los tickets</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="pages/layout/top-nav.html" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Atendidos</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="<?php echo base_url('admin/tickets/misTickets'); ?>" class="nav-link">
                                <i class="fas fa-user nav-icon"></i>
                                <p>Mis tickets</p>
                            </a>
                        </li>
                    </ul>
                </li>




                <li class="nav-item">
                    <a href="<?php echo base_url('admin/areas'); ?>" class="nav-link">
                        <i class="nav-icon fa fa-cog"></i>
                        <p>
                            Configuración
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo base_url('admin/areas'); ?>" class="nav-link">
                                <i class="fas fa-circle text-secondary nav-icon"></i>
                                <p>Áreas</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('admin/categorias'); ?>" class="nav-link">
                                <i class="fas fa-circle text-primary nav-icon"></i>
                                <p>Categorias</p>
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