<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Laravel</title>

	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
	<link href="{{ asset('/css/bootstrap.min.css') }}" rel="stylesheet">
	<link href="{{ asset('/css/owl.carousel.css') }}" rel="stylesheet">
	<link href="{{ asset('/css/owl.theme.css') }}" rel="stylesheet">
	<link href="{{ asset('/css/style.css') }}" rel="stylesheet">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body class="navbar-is-fixed-top {{ Lang::getLocale() }}">
	@include('menu.navbar')

	@yield('content')

	<div id="modal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	<!-- Scripts -->
	<script src="//maps.google.com/maps/api/js?sensor=true&amp;language={{ Lang::getLocale() }}"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/gmaps.js/0.4.22/gmaps.min.js"></script>
	<script src="{{ asset('/js/jquery-1.11.1.min.js') }}"></script>
	<script src="{{ asset('/js/bootstrap.min.js') }}"></script>
	<script src="{{ asset('/js/scripts.min.js') }}"></script>
	<script src="{{ asset('/js/owl.carousel.min.js') }}"></script>
</body>
</html>
