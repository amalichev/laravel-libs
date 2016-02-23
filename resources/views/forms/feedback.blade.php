{!! Form::open(['route' => 'feedback', 'id'=>'feedback', 'class' => 'ajax']) !!}
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
        {!! Form::label('message', trans('forms.message')) !!}
        {!! Form::textarea('message', null, ['class' => 'form-control', 'required' => 'true']) !!}
    </div>
    <div class="form-group">
        {!! Form::button(trans('forms.send'), ['type' => 'submit', 'class' => 'btn btn-primary']) !!}
    </div>
{!! Form::close() !!}
