<?php namespace App\Forms;

use SleepingOwl\Admin\FormItems\NamedFormItem;

class AdminParentCategory extends NamedFormItem
{

    public function render()
    {
        $params = $this->getParams();

        return view('admin.forms.parent_category', $params);
    }

}
