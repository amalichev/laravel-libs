<?php

use App\Models\Callback;
use App\Models\Feedback;
use App\Models\Review;

Route::get('', [
	'as' => 'admin.home',

	function() {
		$data['reviews'] = Review::count();
		$data['messages'] = [
			'callback' => Callback::count(),
			'feedback' => Feedback::count(),
		];

		return Admin::view(view('admin.home', $data), 'Панель управления');
	}
]);

Route::get('locale/switch', [
	'as'   => 'locale.switch',
	'uses' => '\App\Http\Controllers\Admin\LocaleController@switchLocale',
]);
