<?php

Admin::model('App\Models\Widget')->title('Виджеты')->alias('widgets')->display(function () {
    $display = AdminDisplay::datatables();

    $display->columns([
        Column::string('title')->label('Заголовок'),
        Column::string('slug')->label('Псевдоним'),
    ]);
    return $display;

})->createAndEdit(function () {
    $form = AdminForm::form();

    $form->items([
        FormItem::columns()->columns([
            [
                FormItem::text('title', 'Заголовок')->required(),
                FormItem::text('slug', 'Псевдоним')->required(),
            ],
            [

            ],
        ]),
    ]);
    return $form;
})->delete(null);