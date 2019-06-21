<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Province extends Model
{
    //
    protected $fillable  = ['title','code','state_id','country_id'];
    protected $fieldspec = [];

    public function state()
	{
        return $this->belongsTo('App\State');
    }

    public function country()
	{
        return $this->belongsTo('App\Country');
    }

	public function cities()
	{
		return $this->hasMany('App\City', 'province_code', 'code');
	}

    function getFieldSpec ()
        // set the specifications for this database table
    {

        // build array of field specifications
        $this->fieldspec['id'] = [
            'type'     => 'integer',
            'minvalue' => 0,
            'pkey'     => 'y',
            'required' =>true,
            'label'    => 'id',
            'hidden'   => 1,
            'display'  => 0,
        ];
        $this->fieldspec['country_id'] = [
            'type'      => 'relation',
            'model'     => 'Country',
            'foreign_key' => 'id',
            'label_key' => 'name',
            'label'     => 'Country',
            'hidden'    => 0,
            'required'  =>  true,
            'display'   => 1,
        ];
        $this->fieldspec['state_id'] = [
            'type'      => 'relation',
            'model'     => 'State',
            'foreign_key' => 'id',
            'label_key' => 'title',
            'label'     => 'State/Regione',
            'hidden'    => 0,
            'required'  =>  true,
            'display'   => 1,
        ];
        $this->fieldspec['title'] = [
            'type'      => 'string',
            'required'  => true,
            'hidden'    => 0,
            'label'     => 'title',
            'extraMsg'  => '',
            'display'   =>  1,
        ];
        $this->fieldspec['code']    = [
            'type'      => 'string',
            'required'  => true,
            'hidden'    => 0,
            'label'     => 'Code',
            'extraMsg'  => '',
            'display'   =>  1,
        ];
        $this->fieldspec['pub'] = [
            'type'     => 'boolean',
            'required' => false,
            'hidden'   => 0,
            'label'    => trans('admin.label.active'),
            'display'  => 1
        ];
        return $this->fieldspec;
    }
}
