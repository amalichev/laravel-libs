<?php namespace App\Http\Controllers;

use App\Models\Setting;
use App\Models\Widget;
use App\Models\Slideshow;
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
		return view('home', [
			'slideshows'    => Slideshow::orderFirst()->published()->get(),
			'reviews'       => Review::orderLast()->published()->simplepaginate(4),
			'gmap'         => [
				'map'       => Map::find(2),
				'locations' => $locations->getLocations(2),
			],
			'widget'       => [
				'callback'  => Widget::where('slug', '=', 'callback')->first(),
				'reviews'   => Widget::where('slug', '=', 'reviews')->first(),
				'feedback'  => Widget::where('slug', '=', 'feedback')->first(),
				'location'  => Widget::where('slug', '=', 'location')->first(),
			],

		]);
	}

}
