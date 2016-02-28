<?php

use App\Models\CategoryTranslation;

use Illuminate\Support\Facades\Session;

Admin::model('App\Models\Category')->title('Категории')->alias('categories')->display(function () {
    $display = AdminDisplay::datatables();

    $display->apply(function ($query) {
        return $query->orderBy('order', 'asc');
    });

    $display->columns([
        Column::string('title')->label('Заголовок'),
        Column::custom()->label('Опубликовано')->callback(function($instance){
            return $instance->status ? '<i class="fa fa-check"></i>' : '<i class="fa fa-times"></i>';
        }),
        Column::datetime('updated_at')->label('Обновлено'),
        Column::order()
    ]);
    return $display;

})->createAndEdit(function () {
    $form = AdminForm::tabbed();

    $form->items([
        'Общие' => [
            FormItem::columns()->columns([
                [
                    FormItem::register('parent_category', 'App\Forms\AdminParentCategory'),

                    FormItem::text('title', 'Заголовок')->required(),
                    FormItem::image('image', 'Изображение'),
                    FormItem::text('slug', 'ЧПУ')->unique()->required(),
                    FormItem::checkbox('status', 'Опубликовано')->defaultValue(1),
                ],
                [
                    FormItem::ckeditor('description', 'Описание'),
                    FormItem::parent_category('parent_id'),
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