<?php

/** @var \Laravel\Lumen\Routing\Router $router */
$router->get('/product', 'ProductController@index');
$router->group(['prefix' => 'api/v1'], function () use ($router) {

    /* router country */
    $router->get('/country/list', 'CountryController@list');
    $router->get('/country/get', 'CountryController@show');
    $router->post('/country/add', 'CountryController@create');
    $router->post('/country/update', 'CountryController@update');
    $router->post('/country/delete', 'CountryController@delete');

    /* router state */
    $router->get('/state/list', 'StateController@list');
    $router->get('/state/get', 'StateController@show');
    $router->post('/state/add', 'StateController@create');
    $router->post('/state/update', 'StateController@update');
    $router->post('/state/delete', 'StateController@delete');

});


