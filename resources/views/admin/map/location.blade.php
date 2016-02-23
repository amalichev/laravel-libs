<div class="form-group ">
    <label for="map">Локация</label>
    <div id="map" style="height: 370px;"></div>
</div>

<script>
    $(function () {
        map = new GMaps({
            zoom: 16,
            div: '#map',
            lat: {{ $instance->lat ? $instance->lat: 42.875696724861676 }},
            lng: {{ $instance->lng ? $instance->lng: 74.61166547238804 }}
        });
        marker = map.addMarker({
            lat: {{ $instance->lat ? $instance->lat: 42.875696724861676 }},
            lng: {{ $instance->lng ? $instance->lng: 74.61166547238804 }},
            draggable: true,
            dragend: function () {
                position = marker.getPosition() + '';
                coords = position.split(',', 2);
                lat = coords[0].replace('(', '');
                lng = coords[1].replace(')', '');
                $('*[name=lat]').val(lat);
                $('*[name=lng]').val(lng);
            }
        });
    });
</script>