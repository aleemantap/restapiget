<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\Uuid;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Blameable;

class City extends Model 
{
    use Blameable;
	use HasFactory;
    use Uuid;
    protected $table = "tms_city";
	const CREATED_AT = 'create_ts';
    const UPDATED_AT = 'update_ts';
    
    //protected $fillable = [
    //    'version', 'create_ts', 'created_by', 'update_ts', 'updated_by', 'delete_ts', 'deleted_by', 'name','states_id'
    //];

    protected $hidden = ['states_id'];
	
	public function state()
    {
        return $this->belongsTo('App\Models\State', 'states_id', 'id');
    }


}
