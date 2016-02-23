<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::group(
	[
		'prefix' => LaravelLocalization::setLocale(),
		'middleware' => [ 'localeSessionRedirect', 'localizationRedirect' ]
	],
	function() {
		Route::get('/', 'HomeController@index');
	}
);

Route::post('/callback', [
	'as' => 'callback',
	'uses' => 'CallbackController@store'
]);

Route::get('/ajax/callback', [
	'as' => 'ajax.callback',
	'uses' => 'CallbackController@ajaxCallback'
]);

Route::post('/feedback', [
	'as' => 'feedback',
	'uses' => 'FeedbackController@store'
]);

Route::get('/ajax/review/{id}', [
	'as' => 'ajax.review',
	'uses' => 'ReviewController@ajaxReviewMore'
]);

Route::get('/ajax/reviews', [
	'as' => 'ajax.reviews',
	'uses' => 'ReviewController@ajaxReviewsPager'
]);

Route::controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);
