<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Location extends Model {

    use \Dimsav\Translatable\Translatable;

    public $translatedAttributes = ['title', 'text'];

	public function map()
    {
        return $this->belongsTo('App\Models\Map');
    }

	public function marker()
    {
        return $this->belongsTo('App\Models\Marker');
    }

    public function getLocations($id)
    {
        $locations = Location::with('marker')
            ->where('map_id', '=', $id)
            ->published()
            ->get();

        return $locations;
    }

    public function scopePublished($query)
    {
        return $query->where('status', '=', 1);
    }

}
