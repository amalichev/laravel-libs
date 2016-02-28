<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model {

    use \SleepingOwl\Admin\Traits\OrderableModel, \Dimsav\Translatable\Translatable;

    public $translatedAttributes = ['title', 'description', 'seo_title', 'seo_description', 'seo_keywords'];

    public function getOrderField()
    {
        return 'order';
    }

}
