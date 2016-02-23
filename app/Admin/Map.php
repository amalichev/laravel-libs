<?php

Admin::model('App\Models\Map')->title('Карты')->alias('maps')->display(function () {
    $display = AdminDisplay::datatables();

    $display->columns([
        Column::string('title')->label('Заголовок'),
        Column::string('width')->label('Ширина'),
        Column::string('height')->label('Высота'),
        Column::custom()->label('Опубликовано')->callback(function($instance){
            return $instance->status ? '<i class="fa fa-check"></i>' : '<i class="fa fa-times"></i>';
        }),
        Column::datetime('updated_at')->label('Обновлено'),
    ]);
    return $display;

})->createAndEdit(function () {
    $form = AdminForm::form();

    $form->items([
        FormItem::columns()->columns([
            [
                FormItem::register('number', 'App\Forms\AdminMapZoom'),

                FormItem::text('title', 'Заголовок')->required(),
                FormItem::text('width', 'Ширина')->required(),
                FormItem::text('height', 'Высота')->required(),
                FormItem::number('zoom'),
                FormItem::textarea('style', 'Стиль'),
                FormItem::checkbox('status', 'Опубликовано')->defaultValue(1),
            ],
            [
                FormItem::view('admin.map.map'),
                FormItem::hidden('lat')->defaultValue(42.875696724861676),
                FormItem::hidden('lng')->defaultValue(74.61166547238804),
            ],
        ]),
    ]);
    return $form;
});