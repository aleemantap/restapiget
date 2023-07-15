<?php

namespace App\Http\Controllers;
use App\Models\Application;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;



class ApplicationController extends Controller
{
    public function list(Request $request){

        try {

                $pageSize = $request->pageSize;
                $pageNum = $request->pageNum;
                $name = $request->name;
                $query = Application::whereNull('deleted_by');
                if($request->name != '')
                {
                    $query->where('name', $request->name);
                }
                $count = $query->get()->count();
                $results = $query->offset(($pageNum-1) * $pageSize) 
                ->limit($pageSize)->orderBy('name', 'ASC')
                ->get();
                
                if($count > 0)
                {
                    return response()->json(['responseCode' => '0000', 
                                        'responseDesc' => 'OK',
                                        'pageSize'  =>  $pageSize,
                                        'totalPage' => ceil($count/$pageSize),
                                        'total' => $count,
                                        'rows' => $results
                                    ]);
                }
                else
                {
                    return response()->json(['responseCode' => '0400', 
                                        'responseDesc' => 'Data Not Found',
                                        'rows' => $results
                                        
                                    ]);
                }
                
        } catch (\Exception $e) {
            return response()->json(['status' => '3333', 'message' => $e->getMessage()]);
        }
    }

   
    public function create(Request $request){
       
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:100|unique:tms_application',
            'package_name' =>  'required|max:255|unique:tms_application',
            'app_version' => 'required|max:50',
            'description' => 'max:255',
            'uninstallable'=>  'boolean',  
            'company_name'=>  'required|max:100', 
            'checksum' => 'required|max:32', 
            'unique_name' => 'required|max:50', 
            'unique_icon_name' => 'required|max:50', 
            'tenant_id' => 'required|max:50', 
            'icon_url' => 'required|max:255', 
        ]);
 
        if ($validator->fails()) {
            return response()->json(['responseCode' => '5555', //gagal validasi
                                     'responseDesc' => $validator->errors()]
                                    );
        }

        try {

            $app = new Application();
            $app->version = 1; 
            $app->name = $request->name;
            $app->package_name = $request->package_name;
            $app->app_version = $request->app_version;
            $app->description = $request->description;
            $app->uninstallable = $request->uninstallable;
            $app->company_name = $request->company_name;
            $app->checksum = $request->checksum;
            $app->unique_name = $request->unique_name;
            $app->unique_icon_name = $request->unique_icon_name;
        
            if ($app->save()) {
                return response()->json(['responseCode' => '0000', //sukses insert
                                          'responseDesc' => 'Application created successfully',
                                          'generatedId' =>  $app->id
                                        ]);
            }
        } catch (\Exception $e) {
            return response()->json(['responseCode' => '3333', //gagal exception 
                                     'responseDesc' => $e->getMessage()
                                    ]);
        }

    }

    public function update(Request $request){

        $validator = Validator::make($request->all(), [
            'version' => 'required|numeric|max:32',
            'id' => 'required',
            
        ]);
 
        if ($validator->fails()) {
            return response()->json(['responseCode' => '5555', //gagal validasi
                                     'responseDesc' => $validator->errors()]
                                    );
        }

        try {

            $app = Application::where([
                ['id',$request->id],
                ['version',$request->version]
               
            ])->first();

            $app->version = $request->version + 1;
            $app->name = $request->name;
            $app->package_name = $request->package_name;
            $app->app_version = $request->app_version;
            $app->description = $request->description;
            $app->uninstallable = $request->uninstallable;
            $app->company_name = $request->company_name;
            $app->checksum = $request->checksum;
            $app->unique_name = $request->unique_name;
            $app->unique_icon_name = $request->unique_icon_name;
            
            if ($app->save()) {
                return response()->json(['responseCode' => '0000', //sukses update
                                          'responseDesc' => 'Application updated successfully',
                                        
                                        ]);
            }
        } catch (\Exception $e) {
            return response()->json([
            'responseCode' => '3333', 
            'responseDesc' => "Application Update Failure"
        ]);
        }
    }
    
    public function show(Request $request){
        try {
            $app = Application::where('id', $request->id)->whereNull('deleted_by');
            
            
            if($app->get()->count()>0)
            {
                $app =  $app->get()->makeHidden(['deleted_by', 'delete_ts']);
                return response()->json([
                    'responseCode' => '0000', 
                    'responseDesc' => 'OK',
                    'data' => $app
                    
                ]);
            }
            else
            {
           
                return response()->json([
                    'responseCode' => '0400', 
                    'responseDesc' => 'Data Not Found',
                    'data' => []                   
                ]);
            }
            
        }
        catch(\Exception $e)
        {
            return response()->json(['responseCode' => '3333', 'responseDesc' => $e->getMessage()]);
        }
    }


    public function delete(Request $request){
        try {
            $m = Application::where('id','=',$request->id)
            ->where('version','=',$request->version);
             $cn = $m->get()->count();
             if( $cn > 0)
             {
                $updateMt = $m->first();
                $current_date_time = \Carbon\Carbon::now()->toDateTimeString();
                $updateMt->delete_ts = $current_date_time; 
                $updateMt->deleted_by = "admin";//Auth::user()->id 
                if ($updateMt->save()) {
                     return response()->json(['responseCode' => '0000', 'responseDesc' => 'Device Profile  deleted successfully']);
                 }
             }
             else
             {
                     return response()->json(['responseCode' => '0400', 'responseDesc' => 'Data Not Found']);
              }

            
        } catch (\Exception $e) {
            return response()->json(['responseCode' => '3333', 'responseDesc' => $e->getMessage()]);
        }
    }


    
}
