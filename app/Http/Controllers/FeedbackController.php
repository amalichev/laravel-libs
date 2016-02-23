<?php namespace App\Http\Controllers;

use App\Models\Feedback;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Response;

class FeedbackController extends Controller {

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		app()->setLocale(Session::get('locale'));

		$rules = [
			'name'    => 'required|min:3|max:255',
			'email'   => 'email|max:255',
			'phone'   => 'required|max:255',
			'message' => 'required',
		];
		$validator = Validator::make($request->all(), $rules);

		if ($validator->fails()) {
			return Response::json([
				'validator' => false,
				'message'   => $validator->errors()
			]);
		} else {
			$data = [
				'field_name'    => Input::get('name'),
				'field_email'   => Input::get('email'),
				'field_phone'   => Input::get('phone'),
				'field_message' => Input::get('message'),
			];
			Mail::send('emails.feedback', $data, function($message) {
				$message->to('webapace@gmail.com')->subject(trans('email.new_message'));
			});
			Feedback::create($request->all());

			return Response::json([
				'validator' => true,
				'message'   => trans('forms.feedback_success')
			]);
		}
	}

}
