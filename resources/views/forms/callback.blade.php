<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">×</button>
    <h3>{{ trans('widgets.call') }}</h3>
</div>
<div class="modal-body">
    {!! Form::open(['route' => 'callback', 'id'=>'callback', 'class' => 'ajax']) !!}
    <div class="form-group">
        {!! Form::label('name', trans('forms.name')) !!}
        {!! Form::text('name', null, ['class' => 'form-control', 'required' => 'true']) !!}
    </div>
    <div class="form-group">
        {!! Form::label('email', 'E-Mail') !!}
        {!! Form::email('email', null, ['class' => 'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::label('phone', trans('forms.phone')) !!}
        {!! Form::text('phone', null, ['class' => 'form-control', 'required' => 'true']) !!}
    </div>
    <div class="form-group">
        {!! Form::button(trans('forms.send'), ['type' => 'submit', 'class' => 'btn btn-primary']) !!}
    </div>
    {!! Form::close() !!}
</div>
