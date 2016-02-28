<?php

Admin::model('App\Models\Review')->title('Отзывы')->alias('reviews')->display(function () {
    $display = AdminDisplay::datatables();

    $display->apply(function ($query) {
        return $query->orderBy('order', 'asc');
    });

    $display->columns([
        Column::image('image')->label('Изображение'),
        Column::string('title')->label('Имя'),
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
                FormItem::textarea('teaser', 'Тизер')->required(),
                FormItem::ckeditor('text', 'Полная версия')->required(),
            ],
            [
//                FormItem::register('number', 'App\Forms\AdminOrder'),

                FormItem::text('title', 'Имя')->required(),
                FormItem::text('position', 'Должность'),
                FormItem::image('image', 'Изображение'),
                FormItem::text('slug', 'ЧПУ')->unique()->required(),
//                FormItem::number('order'),
                FormItem::checkbox('status', 'Опубликовано')->defaultValue(1),
            ],
        ]),
    ]);
    return $form;
});