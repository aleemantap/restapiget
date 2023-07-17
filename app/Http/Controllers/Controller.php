<?php

namespace App\Http\Controllers;

use Laravel\Lumen\Routing\Controller as BaseController;

class Controller extends BaseController
{
    
    protected $responseSuccess;
    protected $responseFailure;

    public function __construct() {
        $this->responseSuccess = "SUCCESS OK";
        $this->responseFailure = "Failure";
    }
    
}
