@foreach($reviews as $review)
    <div class="col-lg-6 col-md-6">
        <div class="image">
            <img src="{{ route('imagecache', ['review', $review->image]) }}" alt="{!! $review->title !!}">
        </div>
        <div class="info">
            <div class="name">{!! $review->title !!}</div>
            <div class="position">{!! $review->position !!}</div>
            <div class="teaser">{!! $review->teaser !!}</div>
            <div class="read-more">
                <a href="/ajax/review/{{ $review->id }}" class="popup ajax" data-path="/ajax/review/{{ $review->id }}" data-target="#modal" data-toggle="modal">
                    {!! trans('forms.read_more') !!}
                </a>
            </div>
        </div>
        <br>
    </div>
@endforeach

@if($reviews->nextPageUrl())
    <nav style="clear: both;">
        <ul class="pager load-more ajax">
            <li><a href="{!! $reviews->nextPageUrl() !!}">{!! trans('pagination.more') !!}</a></li>
        </ul>
    </nav>
@endif