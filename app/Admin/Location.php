<?php

\SleepingOwl\Admin\AssetManager\AssetManager::addScript('//maps.google.com/maps/api/js?sensor=true');
\SleepingOwl\Admin\AssetManager\AssetManager::addScript('//cdnjs.cloudflare.com/ajax/libs/gmaps.js/0.4.22/gmaps.min.js');

use App\Models\Map;
use App\Models\Marker;


Admin::model('App\Models\Location')->title('Локации')->alias('locations')->display(function () {
    $display = AdminDisplay::datatables();

    $display->columns([
        Column::string('title')->label('Заголовок'),
        Column::string('map.title')->label('Карта'),
        Column::custom()->label('Опубликовано')->callback(function($instance){
            return $instance->status ? '<i class="fa fa-check"></i>' : '<i class="fa fa-times"></i>';
        }),
        Column::datetime('updated_at')->label('Обновлено'),
    ]);
    return $display;

})->createAndEdit(function () {
    $maps = Map::lists('title', 'id');
    $markers = Marker::lists('title', 'id');

    $form = AdminForm::form();

    $form->items([
        FormItem::columns()->columns([
            [
                FormItem::text('title', 'Заголовок')->required(),
                FormItem::ckeditor('text', 'Текст'),
                FormItem::select('map_id', 'Карта')
                    ->options($maps)->required(),
                FormItem::checkbox('status', 'Опубликовано')->defaultValue(1),
            ],
            [
                FormItem::view('admin.map.location'),
                FormItem::hidden('lat')->defaultValue(42.875696724861676),
                FormItem::hidden('lng')->defaultValue(74.61166547238804),
                FormItem::select('marker_id', 'Маркер')
                    ->options($markers)->required(),
            ],
        ]),
    ]);
    return $form;
});