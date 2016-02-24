<?php namespace App\Http\Controllers;

use App\Models\Setting;
use App\Models\Widget;
use App\Models\Callback;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Response;

class CallbackController extends Controller {

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function ajaxCallback()
	{
		app()->setLocale(Session::get('locale'));

		return view('forms.callback', [
			'callback' => Widget::where('slug', '=', 'callback')->first()
		]);
	}

	public function store(Request $request)
	{
		app()->setLocale(Session::get('locale'));

		$rules = [
			'name'    => 'required|min:3|max:255',
			'email'   => 'email|max:255',
			'phone'   => 'required|max:255',
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
			];
			Mail::send('emails.callback', $data, function($message) {
				$email = Setting::where('slug', '=', 'email')->first();

				$message->to($email->value)->subject(trans('email.callback'));
			});
			Callback::create($request->all());

			return Response::json([
				'validator' => true,
				'message'   => trans('forms.callback_success')
			]);
		}
	}

}
