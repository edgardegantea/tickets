<?php

namespace Config;
use CodeIgniter\Router\RouteCollection;
use CodeIgniter\Router\RouteGroup;
use CodeIgniter\Router\RouteResource;



// Create a new instance of our RouteCollection class.
$routes = Services::routes();



/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
// $routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */


$routes->get('/', 'Home::index');


$routes->match(['get', 'post'], 'login', 'UserController::login', ["filter" => "noauth"]);


// Admin routes
$routes->group("admin", ["filter" => "auth"], function ($routes) {
    
    $routes->get('/', 'Admin\AdminController::index');

    // $routes->get('userinfo', 'admin\UsuariosController::index');
    // $routes->get('userinfo/new', 'admin\UsuariosController::new');
    
    $routes->get('perfil', 'Admin\AdminController::perfil');

    // Ruta para testear creación de pdf
    $routes->get('tickets/pdf', 'Admin\TicketController::generarPDF');
    $routes->get('tickets/misTickets', 'Admin\TicketController::misTickets');
    $routes->get('tickets/(:num)/agregarMensaje', 'Admin\TicketController::agregarMensaje/$1');
    $routes->post('tickets/mensajes', 'Admin\TicketController::guardarMensaje');


    $routes->resource('tickets', ['controller' => 'Admin\TicketController']);
    $routes->resource('usuarios', ['controller' => 'Admin\UsuariosController']);
    $routes->resource('areas', ['controller' => 'Admin\AreaController']);
    $routes->resource('categorias', ['controller' => 'Admin\CategoriaController']);

    /*
    $routes->group('posts', ['namespace' => 'App\Controllers'], function(RouteCollection $routes) {
        $routes->get('/', 'PostController::index');
        $routes->get('show/(:num)', 'PostController::show/$1');
        $routes->get('create', 'PostController::create');
        $routes->post('store', 'PostController::store');
        $routes->get('edit/(:num)', 'PostController::edit/$1');
        $routes->put('update/(:num)', 'PostController::update/$1');
        $routes->patch('update/(:num)', 'PostController::update/$1');
        $routes->delete('delete/(:num)', 'PostController::delete/$1'); 
    
    
        $routes->get('(:num)/add-comment', 'PostController::addComment/$1');
        $routes->post('comments', 'PostController::storeComment');
    });
    */

    /*
    $routes->group('tickets', ['namespace' => 'App\Controllers\Admin'], function(RouteCollection $routes) {
        $routes->get('(:num)/agregarMensaje', 'TicketController::agregarMensaje/$1');
        $routes->post('mensajes', 'TicketController::guardarMensaje');
    });
    */

});





// Editor routes
$routes->group("usuario", ["filter" => "auth"], function ($routes) {
    $routes->get("/", "Usuario\UsuarioController::index");
    $routes->get("perfil", "Usuario\UsuarioController::perfil");
    $routes->resource('tickets', ['controller' => 'Usuario\TicketController']);
});


$routes->get('logout', 'UserController::logout');








/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
