<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="{{ url('/') }}">Laravel</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <div class="navbar-form navbar-right">
                <a href="/ajax/callback" class="popup ajax btn btn-primary" data-path="/ajax/callback" data-target="#modal" data-toggle="modal">
                    {{ trans('widgets.call') }}
                </a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                @if(Lang::getLocale() == 'en')
                    <li class="active"><a href="{{ LaravelLocalization::getLocalizedURL('en') }}">English</a></li>
                @else
                    <li><a href="{{ LaravelLocalization::getLocalizedURL('en') }}">English</a></li>
                @endif

                @if(Lang::getLocale() == 'ru')
                    <li class="active"><a href="{{ LaravelLocalization::getLocalizedURL('ru') }}">Русский</a></li>
                @else
                    <li><a href="{{ LaravelLocalization::getLocalizedURL('ru') }}">Русский</a></li>
                @endif
            </ul>
        </div>
    </div>
</nav>
