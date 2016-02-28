<h4>Сообщения</h4>
<div class="row">
    @include('admin.panels', [
    'title' => 'Обратный звонок',
    'value' => $messages['callback'],
    'alias' => 'callback',
    'style' => 'blue',
    'icon'  => 'fa-envelope'])

    @include('admin.panels', [
    'title' => 'Обратная связь',
    'value' => $messages['feedback'],
    'alias' => 'feedback',
    'style' => 'blue',
    'icon'  => 'fa-envelope'])
</div>

<h4>Отзывы</h4>
<div class="row">
    @include('admin.panels', [
    'title' => 'Отзывы',
    'value' => $reviews,
    'alias' => 'reviews',
    'style' => 'blue',
    'icon'  => 'fa-comments'])
</div>
