<?php namespace App\Http\Controllers;

use App\Models\Review;
use App\Models\Map;
use App\Models\Location;
use App\Http\Requests;


class HomeController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Location $locations)
	{
		$gmap_id = 2;

		return view('home', [
			'reviews' => Review::latest()->published()->simplepaginate(4),
			'gmap' => [
				'map'    => Map::find($gmap_id),
				'locations' => $locations->getLocations($gmap_id),
			],

		]);
	}

}
