<?php namespace App\Forms;

use SleepingOwl\Admin\FormItems\NamedFormItem;

class AdminMapZoom extends NamedFormItem
{

    public function render()
    {
        $params = $this->getParams();

        return view('admin.map.zoom', $params);
    }

}
