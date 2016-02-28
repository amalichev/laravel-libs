<?php

\SleepingOwl\Admin\AssetManager\AssetManager::addStyle('/packages/sleeping-owl/admin/default/css/formitems/select/chosen.css');

\SleepingOwl\Admin\AssetManager\AssetManager::addScript('/packages/sleeping-owl/admin/default/js/formitems/select/chosen.jquery.min.js');
\SleepingOwl\Admin\AssetManager\AssetManager::addScript('/packages/sleeping-owl/admin/default/js/formitems/select/init.js');

function parentCategory($column, $id) {
    return App\Models\Category::where($column, '=', $id);
}
?>

@unless(parentCategory('parent_id', $instance->id)->first())
    <div class="form-group ">
        <label for="parent_id">Родительская категория</label>
        <div>
            <select id="parent_id" name="parent_id" class="form-control multiselect"  data-select-type="single" >
                <option value="0">--- Не выбрано ---</option>
                @foreach(App\Models\Category::all() as $value)
                    @unless(empty($value->title))
                        @unless($instance->id == $value->id)
                            @if(parentCategory('parent_id', $instance->id)->first() == $value->parent_id)
                                <option value="{{ $value->id }}" selected="selected">
                                    @if($value->parent_id !== 0)
                                        {{ parentCategory('id', $value->parent_id)->first()->title }} > {{ $value->title }}
                                    @else
                                        {{ $value->title }}
                                    @endif
                                </option>
                            @else
                                <option value="{{ $value->id }}">
                                    @if($value->parent_id !== 0)
                                        {{ parentCategory('id', $value->parent_id)->first()->title }} > {{ $value->title }}
                                    @else
                                        {{ $value->title }}
                                    @endif
                                </option>
                            @endif
                        @endunless
                    @endunless
                @endforeach
            </select>
        </div>
    </div>
@endunless

