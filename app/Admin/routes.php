<?php

Route::get('', [
	'as' => 'admin.home',

	function() {
		$content = '';

		return Admin::view($content, 'Панель управления');
	}
]);

Route::get('locale/switch', [
	'as' => 'locale.switch',
	'uses' => '\App\Http\Controllers\Admin\LocaleController@switchLocale',
]);
