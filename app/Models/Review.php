<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Review extends Model {

    use \SleepingOwl\Admin\Traits\OrderableModel, \Dimsav\Translatable\Translatable;

    public $translatedAttributes = ['title', 'position', 'teaser', 'text'];

    public function getOrderField()
    {
        return 'order';
    }

    public function scopePublished($query)
    {
        return $query->where('status', '=', 1);
    }

    public function scopeLimitLast($query)
    {
        return $query
            ->take(4)
            ->published()
            ->orderBy('order', 'desc');
    }

    public function scopeLimitFirst($query)
    {
        return $query
            ->take(4)
            ->published()
            ->orderBy('order', 'asc');
    }

}
