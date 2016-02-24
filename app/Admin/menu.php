<?php

Admin::menu()->url('/')->label('Главная')->icon('fa-dashboard');

Admin::menu()->label('Сообщения')->icon('fa-envelope')->items(function () {
    Admin::menu(\App\Models\Callback::class)
        ->icon('fa-caret-right')
        ->label('Обратный звонок');
    Admin::menu(\App\Models\Feedback::class)
        ->icon('fa-caret-right')
        ->label('Обратная связь');
});

Admin::menu(\App\Models\Slideshow::class)
    ->icon('fa-file-image-o')
    ->label('Слайдшоу');

Admin::menu(\App\Models\Review::class)
    ->icon('fa-comments')
    ->label('Отзывы');

Admin::menu(\App\Models\Setting::class)
    ->icon('fa-cogs')
    ->label('Настройки');

Admin::menu(\App\Models\Widget::class)
    ->icon('fa-sliders')
    ->label('Виджеты');

Admin::menu()->label('Google Map')->icon('fa-map-marker')->items(function () {
    Admin::menu(\App\Models\Map::class)
        ->icon('fa-caret-right')
        ->label('Карты');
    Admin::menu(\App\Models\Location::class)
        ->icon('fa-caret-right')
        ->label('Локации');
    Admin::menu(\App\Models\Marker::class)
        ->icon('fa-caret-right')
        ->label('Маркеры');
});