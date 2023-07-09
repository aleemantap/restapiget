<?php

namespace App\Http\Controllers;
use App\Models\Country;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CountryController extends Controller
{
    public function index(){
        $country = Country::all();
        return response()->json($country);
    }


    public function create(Request $request){
        try {
            $country = new Country();
            $country->id = Str::uuid();
            $country->version = $request->version;
            $country->code = $request->code;
            $country->name = $request->name;
            


            if ($country->save()) {
                return response()->json(['status' => true, 'message' => 'Country created successfully']);
            }
        } catch (\Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage()]);
        }

    }

    public function update(Request $request, $id){
        try {
            $country = Country::find($id);

            $country->version = $request->version;
            $country->code = $request->code;
            $country->name = $request->name;
            if ($country->save()) {
                return response()->json(['status' => true, 'message' => 'Country updated successfully']);
            }
        } catch (\Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage()]);
        }
    }

    public function show($id){
        $country = Country::find($id);
        return response()->json($country);
    }

    public function delete($id){
        try {
            $country = Country::find($id);
            $current_date_time = \Carbon\Carbon::now()->toDateTimeString();
            $country->delete_ts = $current_date_time; 
            $country->deleted_by = "1";//Auth::user()->id
            
            if ($country->save()) {
                return response()->json(['status' => true, 'message' => 'Country deleted successfully']);
            }
        } catch (\Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage()]);
        }
    }
    
}
