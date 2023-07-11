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

    /* router city */
    $router->get('/city/list', 'CityController@list');
    $router->get('/city/get', 'CityController@show');
    $router->post('/city/add', 'CityController@create');
    $router->post('/city/update', 'CityController@update');
    $router->post('/city/delete', 'CityController@delete');

    /* router district */
    $router->get('/district/list', 'DistrictController@list');
    $router->get('/district/get', 'DistrictController@show');
    $router->post('/district/add', 'DistrictController@create');
    $router->post('/district/update', 'DistrictController@update');
    $router->post('/district/delete', 'DistrictController@delete');

    /* router merchat_type */
    $router->get('/merchanttype/list', 'MerchantTypeController@list');
    $router->get('/merchanttype/get', 'MerchantTypeController@show');
    $router->post('/merchanttype/add', 'MerchantTypeController@create');
    $router->post('/merchanttype/update', 'MerchantTypeController@update');
    $router->post('/merchanttype/delete', 'MerchantTypeController@delete');

    /* router merchat */
    $router->get('/merchant/list', 'MerchantController@list');
    $router->get('/merchant/get', 'MerchantController@show');
    $router->post('/merchant/add', 'MerchantController@create');
    $router->post('/merchant/update', 'MerchantController@update');
    $router->post('/merchant/delete', 'MerchantController@delete');

      /* router device model */
      $router->get('/devicemodel/list', 'DeviceModelController@list');
      $router->get('/devicemodel/get', 'DeviceModelController@show');
      $router->post('/devicemodel/add', 'DeviceModelController@create');
      $router->post('/devicemodel/update', 'DeviceModelController@update');
      $router->post('/devicemodel/delete', 'DeviceModelController@delete');

});


