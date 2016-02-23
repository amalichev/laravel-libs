<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Slideshow extends Model {

    use \SleepingOwl\Admin\Traits\OrderableModel;

    public function getOrderField()
    {
        return 'order';
    }

    public function scopeOrderFirst($query)
    {
        return $query->orderBy('order', 'asc');
    }

    public function scopeOrderLast($query)
    {
        return $query->orderBy('order', 'desc');
    }

    public function scopePublished($query)
    {
        return $query->where('status', '=', 1);
    }

}
