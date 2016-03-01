<?php

Admin::model('App\Models\Category')->title('Категории')->alias('categories')->display(function () {
    $display = AdminDisplay::tree();
    $display->value('title');

    return $display;

})->createAndEdit(function () {
    $form = AdminForm::tabbed();

    $form->items([
        'Общие' => [
            FormItem::columns()->columns([
                [
                    FormItem::text('title', 'Заголовок')->required(),
                    FormItem::image('image', 'Изображение'),
                    FormItem::text('slug', 'ЧПУ')->unique()->required(),
                    FormItem::checkbox('status', 'Опубликовано')->defaultValue(1),
                ],
                [
                    FormItem::ckeditor('description', 'Описание'),
                ],
            ]),
        ],
        'Метаданные' => [
            FormItem::columns()->columns([
                [
                    FormItem::text('seo_title', 'Заголовок'),
                    FormItem::textarea('seo_description', 'Описание'),
                    FormItem::text('seo_keywords', 'Ключевые слова'),
                ],
                [

                ],
            ]),
        ],
    ]);
    return $form;
});