<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Blameable;

class Country extends Model 
{
    use Blameable;
    protected $table = "tms_country";
    const CREATED_AT = 'create_ts';
    const UPDATED_AT = 'update_ts';
    /**
     * The name of the "updated at" column.
     *
     * @var string
     */
   

    protected $fillable = [
        'uuid','version', 'create_ts', 'created_by', 'update_ts', 'updated_by', 'delete_ts', 'deleted_by', 'code', 'name'
    ];

}
