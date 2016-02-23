<?php

Admin::model('App\Models\Slideshow')->title('Слайдшоу')->alias('slideshow')->display(function () {
    $display = AdminDisplay::datatables();

    $display->apply(function ($query) {
        return $query->orderBy('order', 'asc');
    });

    $display->columns([
        Column::image('image')->label('Изображение'),
        Column::custom()->label('Опубликовано')->callback(function($instance){
            return $instance->status ? '<i class="fa fa-check"></i>' : '<i class="fa fa-times"></i>';
        }),
        Column::datetime('updated_at')->label('Обновлено'),
        Column::order()
    ]);
    return $display;

})->createAndEdit(function () {
    $form = AdminForm::form();

    $form->items([
        FormItem::columns()->columns([
            [
                FormItem::register('number', 'App\Forms\AdminOrder'),

                FormItem::image('image', 'Изображение'),
//                FormItem::number('order'),
                FormItem::checkbox('status', 'Опубликовано')->defaultValue(1),
            ],
            [

            ],
        ]),
    ]);
    return $form;
});