<h4>Сообщения</h4>
<div class="row">
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-blue">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-envelope fa-fw fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">{{ $messages['callback'] }}</div>
                        <div>Обратный звонок</div>
                    </div>
                </div>
            </div>
            <a href="/admin/callback">
                <div class="panel-footer">
                    <span class="pull-left">Подробнее</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-blue">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-envelope fa-fw fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">{{ $messages['feedback'] }}</div>
                        <div>Обратная связь</div>
                    </div>
                </div>
            </div>
            <a href="/admin/feedback">
                <div class="panel-footer">
                    <span class="pull-left">Подробнее</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
</div>

<h4>Отзывы</h4>
<div class="row">
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-blue">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-comments fa-fw fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">{{ $reviews }}</div>
                        <div>Отзывов</div>
                    </div>
                </div>
            </div>
            <a href="/admin/reviews">
                <div class="panel-footer">
                    <span class="pull-left">Подробнее</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
</div>
