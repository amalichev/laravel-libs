<?php

Admin::model('App\Models\Setting')->title('Настройки')->alias('settings')->display(function () {
    $display = AdminDisplay::datatables();

    $display->columns([
        Column::string('title')->label('Название'),
        Column::string('value')->label('Значение'),
        Column::string('slug')->label('Псевдоним'),
    ]);
    return $display;

})->createAndEdit(function () {
    $form = AdminForm::form();

    $form->items([
        FormItem::columns()->columns([
            [
                FormItem::text('title', 'Название')->required(),
                FormItem::text('value', 'Значение')->required(),
                FormItem::text('slug', 'Псевдоним')->required(),
            ],
            [

            ],
        ]),
    ]);
    return $form;
})->delete(null);