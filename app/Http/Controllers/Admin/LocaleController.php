<?php namespace App\Http\Controllers\Admin;

use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Boutique;

class LocaleController extends Controller
{
    public function switchLocale()
    {
        $locale = \Input::get('locale', 'en');

        \Session::set('admin.locale', $locale);

        \Redirect::back()->send();
    }

}
