<?php namespace App\Http\Controllers;

use App\Models\Review;

use Illuminate\Support\Facades\Session;

class ReviewController extends Controller {

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function ajaxReviewMore($id, Review $reviews)
	{
		app()->setLocale(Session::get('locale'));

		$data = $reviews::find($id);

		return view('ajax.review', $data);
	}

	public function ajaxReviewsPager(Review $reviews)
	{
		app()->setLocale(Session::get('locale'));

		$data['reviews'] = $reviews::orderLast()->published()->simplepaginate(4);

		return view('ajax.reviews', $data)->render();
	}

}
