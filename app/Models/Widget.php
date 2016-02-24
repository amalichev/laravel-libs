<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Widget extends Model {

    use \Dimsav\Translatable\Translatable;

    public $translatedAttributes = ['title'];

}
