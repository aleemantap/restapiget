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

    /* router device profile */
    $router->get('/profile/list', 'DeviceProfileController@list');
    $router->get('/profile/get', 'DeviceProfileController@show');
    $router->post('/profile/add', 'DeviceProfileController@create');
    $router->post('/profile/update', 'DeviceProfileController@update');
    $router->post('/profile/delete', 'DeviceProfileController@delete');


    /* router application*/ 
    $router->get('/application/list', 'ApplicationController@list');
    $router->get('/application/get', 'ApplicationController@show');
    $router->post('/application/add', 'ApplicationController@create');
    $router->post('/application/update', 'ApplicationController@update');
    $router->post('/application/delete', 'ApplicationController@delete');


    /* router terminal group*/ 
    $router->get('/terminalgroup/list', 'TerminalGroupController@list');
    $router->get('/terminalgroup/get', 'TerminalGroupController@show');
    $router->post('/terminalgroup/add', 'TerminalGroupController@create');
    $router->post('/terminalgroup/update', 'TerminalGroupController@update');
    $router->post('/terminalgroup/delete', 'TerminalGroupController@delete');


    /* router terminal*/ 
    $router->get('/terminal/list', 'TerminalController@list');
    $router->get('/terminal/get', 'TerminalController@show');
    $router->post('/terminal/add', 'TerminalController@create');
    $router->post('/terminal/update', 'TerminalController@update');
    $router->post('/terminal/restart', 'TerminalController@restart');
    $router->post('/terminal/lockUnlock', 'TerminalController@lockUnlock');

    /* router download task*/ 
    $router->get('/downloadtask/list', 'DownloadTaskController@list');
    $router->get('/downloadtask/get', 'DownloadTaskController@show');
    $router->post('/downloadtask/add', 'DownloadTaskController@create');
    $router->post('/downloadtask/update', 'DownloadTaskController@update');

    /* router download task  application link*/ 
    $router->get('/downloadtaskapplicationlink/list', 'DownloadTaskApplicationLinkController@list');
    $router->get('/downloadtaskapplicationlink/get', 'DownloadTaskApplicationLinkController@show');
    $router->post('/downloadtaskapplicationlink/add', 'DownloadTaskApplicationLinkController@create');
    $router->post('/downloadtaskapplicationlink/update', 'DownloadTaskApplicationLinkController@update');
  
    /* router downloadtasklog*/ 
    $router->get('/downloadtasklog/list', 'DownloadTaskLogController@list');
    $router->get('/downloadtasklog/get', 'DownloadTaskLogController@show');
    $router->post('/downloadtasklog/add', 'DownloadTaskLogController@create');
    $router->post('/downloadtasklog/update', 'DownloadTaskLogController@update');

    /* router download task  terminal group link*/ 
    $router->get('/downloadtaskterminalgrouplink/list', 'DownloadTaskTerminalGroupLinkController@list');
    $router->get('/downloadtaskterminalgrouplink/get', 'DownloadTaskTerminalGroupLinkController@show');
    $router->post('/downloadtaskterminalgrouplink/add', 'DownloadTaskTerminalGroupLinkController@create');
    $router->post('/downloadtaskterminalgrouplink/update', 'DownloadTaskTerminalGroupLinkController@update');

    /* router download task  terminal  link*/ 
    $router->get('/downloadtaskterminallink/list', 'DownloadTaskTerminalLinkController@list');
    $router->get('/downloadtaskterminallink/get', 'DownloadTaskTerminalLinkController@show');
    $router->post('/downloadtaskterminallink/add', 'DownloadTaskTerminalLinkController@create');
    $router->post('/downloadtaskterminallink/update', 'DownloadTaskTerminalLinkController@update');

    /* router hear beat*/ 
    $router->get('/heartbeat/list', 'HeartBeatController@list');
    $router->get('/heartbeat/get', 'HeartBeatController@show');
    $router->post('/heartbeat/add', 'HeartBeatController@create');
    $router->post('/heartbeat/update', 'HeartBeatController@update');


    /*router terminal group link*/ 
    $router->get('/terminalgrouplink/list', 'TerminalGroupLinkController@list');
    $router->get('/terminalgrouplink/get', 'TerminalGroupLinkController@show');
    $router->post('/terminalgrouplink/add', 'TerminalGroupLinkController@create');
    $router->post('/terminalgrouplink/update', 'TerminalGroupLinkController@update');

    
    /* router delete task*/ 
    $router->get('/deletetask/list', 'DeleteTaskController@list');
    $router->get('/deletetask/get', 'DeleteTaskController@show');
    $router->post('/deletetask/add', 'DeleteTaskController@create');
    $router->post('/deletetask/update', 'DeleteTaskController@update');

    /* router delete task app*/ 
    $router->get('/deletetaskapp/list', 'DeleteTaskAppController@list');
    $router->get('/deletetaskapp/get', 'DeleteTaskAppController@show');
    $router->post('/deletetaskapp/add', 'DeleteTaskAppController@create');
    $router->post('/deletetaskapp/update', 'DeleteTaskAppController@update');

    /* router delete tas klog*/ 
    $router->get('/deletetasklog/list', 'DeleteTaskLogController@list');
    $router->get('/deletetasklog/get', 'DeleteTaskLogController@show');
    $router->post('/deletetasklog/add', 'DeleteTaskLogController@create');
    $router->post('/deletetasklog/update', 'DeleteTaskLogController@update');

     /* router delete task  terminal group link*/ 
    $router->get('/deletetaskterminalgrouplink/list', 'DeleteTaskTerminalGroupLinkController@list');
    $router->get('/deletetaskterminalgrouplink/get', 'DeleteTaskTerminalGroupLinkController@show');
    $router->post('/deletetaskterminalgrouplink/add', 'DeleteTaskTerminalGroupLinkController@create');
    $router->post('/deletetaskterminalgrouplink/update', 'DeleteTaskTerminalGroupLinkController@update');
    
    /* router delete task  terminal  link*/ 
    $router->get('/deletetaskterminallink/list', 'DeleteTaskTerminalLinkController@list');
    $router->get('/deletetaskterminallink/get', 'DeleteTaskTerminalLinkController@show');
    $router->post('/deletetaskterminallink/add', 'DeleteTaskTerminalLinkController@create');
    $router->post('/deletetaskterminallink/update', 'DeleteTaskTerminalLinkController@update');

     /* router diagnostic info*/ 
     $router->get('/diagnosticinfo/list', 'DiagnosticInfoController@list');
     $router->get('/diagnosticinfo/get', 'DiagnosticInfoController@show');
     $router->post('/diagnosticinfo/add', 'DiagnosticInfoController@create');
     $router->post('/diagnosticinfo/update', 'DiagnosticInfoController@update');
 
	/* Test */
 

});


