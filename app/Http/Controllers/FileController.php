<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Tes;
use Illuminate\Support\Facades\DB;


class FileController extends Controller
{
    // private $request;

    // public function __construct(Request $request)
    //  {
    //     $this->request = $request;
    // }

   

    public function store(Request $request)
    {
        
        $jResponse = array();
        $jResponse['success'] = true;
        $jResponse['message'] = 'OK';
        $path = \Storage::cloud()->put('files', $request->file('item'));
        $url=\Storage::cloud()->temporaryUrl($path, \Carbon\Carbon::now()->addMinutes(1));
        
        $jResponse['data'] = array(
            "url"=>$url,
            "path"=>$path
        );
        
       // DB::beginTransaction();
        try {
        
            

            $h = new Tes();
            $h->path = $path; 
            $h->url = $url;

            if ($h->save()) {
                return response()->json(['responseCode' => '0000', //sukses insert
                                          'responseDesc' => 'File created successfully',
                                          'generatedId' =>  $h->id,
                                          'path'=>$path,
                                          'url'=>$url,
                                        ]);
               
            }
           // DB::commit();
           //
            //return \Response::json($jResponse, 201);
            //

        } catch (\Exception $e) {
          // DB::rollback();
            return response()->json(['responseCode' => '3333', //gagal exception 
                                    'responseDesc' => $e->getMessage()
                                    ]);
        } 
    }

    public function show(Request $request)
    {
       
		$jResponse = array();
        $jResponse['success'] = true;
        $jResponse['message'] = 'OK';
        $jResponse['data'] = array(
            "url" => \Storage::cloud()->temporaryUrl($request->path, 
            \Carbon\Carbon::now()->addMinutes(1))
        );
        //return \Response::json($jResponse, 201);
        return response()->json($jResponse, 201);
    }
}