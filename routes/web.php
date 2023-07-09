<?php

/** @var \Laravel\Lumen\Routing\Router $router */
$router->get('/product', 'ProductController@index');
$router->group(['prefix' => 'api/v1'], function () use ($router) {

    // $router->get('/product', 'ProductController@index');
    // $router->get('/product/{id}', 'ProductController@show');
    // $router->post('/product', 'ProductController@create');
    // $router->put('/product/{id}', 'ProductController@update');
    // $router->delete('/product/{id}', 'ProductController@delete');

    /* router country */
    $router->get('/country', 'CountryController@index');
    $router->get('/country/{id}', 'CountryController@show');
    $router->post('/country', 'CountryController@create');
    $router->put('/country/{id}', 'CountryController@update');
    $router->delete('/country/{id}', 'CountryController@delete');

});


