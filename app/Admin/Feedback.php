<?php

Admin::model('App\Models\Feedback')->title('Обратная связь')->alias('feedbacks')->display(function () {
    $display = AdminDisplay::table();
    $display->apply(function ($query) {
        $query->orderBy('id', 'desc');
    });
    $display->columns([
        Column::string('name')->label('Имя'),
        Column::custom()->label('E-mail')->callback(function($instance){
            return $instance->email ? $instance->email : '<i class="fa fa-times"></i>';
        }),
        Column::string('phone')->label('Телефон'),
        Column::datetime('created_at')->label('Отправлено'),
    ]);
    return $display;

});