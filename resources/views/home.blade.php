@extends('layout.app')

@section('content')
<div class="container">
	<div id="reviews" class="block">
		<div class="row">
			<h2 class="text-center">{!! trans('widgets.reviews') !!}</h2>
			<br>
			<div class="content">
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
			</div>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="clearfix">
			<div class="col-lg-6 col-md-6">
				<h3>{!! trans('widgets.feedback') !!}</h3>
				<br>
				@include('forms.feedback')
			</div>
			<div class="col-lg-6 col-md-6">
				<h3>{!! trans('widgets.location') !!}</h3>
				<br>
				<div id="map-{!! $gmap['map']->id !!}" style="
					width: {!! $gmap['map']->width !!};
					height: {!! $gmap['map']->height !!};">
				</div>
				<script>
					window.onload = function () {
						map = new GMaps({
							zoom: {!! $gmap['map']->zoom !!},
							div: '#map-{!! $gmap['map']->id !!}',
							lat: {!! $gmap['map']->lat !!},
							lng: {!! $gmap['map']->lng !!},
							scrollwheel: false
						});
						map.setOptions({
							styles: {!! $gmap['map']->style !!}
					});
						@foreach($gmap['locations'] as $location)
							map.addMarker({
							lat: {!! $location->lat !!},
							lng: {!! $location->lng !!},
							title: '{!! $location->title !!}',
							icon: '{!! $location->marker->uri !!}',
							infoWindow: {
								content: <?php print json_encode("$location->text") ?>
							}
						});
						@endforeach
					}
				</script>
			</div>
		</div>
	</div>
</div>
@stop
