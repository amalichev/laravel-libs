<?php

Admin::model('App\Models\Marker')->title('Карты')->alias('markers')->display(function () {
    $display = AdminDisplay::datatables();

    $display->columns([
        Column::image('uri')->label('Маркер'),
        Column::string('title')->label('Заголовок'),
        Column::datetime('updated_at')->label('Обновлено'),
    ]);
    return $display;

})->createAndEdit(function () {
    $form = AdminForm::form();

    $form->items([
        FormItem::columns()->columns([
            [
                FormItem::text('title', 'Заголовок')->required(),
                FormItem::image('uri', 'Маркер')->required(),
            ],
            [

            ],
        ]),
    ]);
    return $form;
});