<?php namespace App\Forms;

use SleepingOwl\Admin\FormItems\NamedFormItem;

class AdminOrder extends NamedFormItem
{

    public function render()
    {
        $params = $this->getParams();

        return view('admin.forms.order', $params);
    }
}
