(function() {
    jQuery(function($) {
        $(document).on('submit', 'form.ajax', function(event) {
            var form = $(this);

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('input[name="_token"]').attr('value')
                }
            });
            event.preventDefault();

            $(document).ajaxStart(function() {
                form.find('*[type="submit"]').attr('disabled', true);
                form.find('*[type="submit"] .ajax-progress').remove();
                form.find('*[type="submit"]').append(
                    '<span class="ajax-progress">&nbsp;<i class="fa fa-refresh fa-spin"></i><span>'
                );
            });

            $(document).ajaxComplete(function() {
                form.find('*[type="submit"]').attr('disabled', false);
                form.find('*[type="submit"] .ajax-progress').remove();
            });

            $.ajax({
                type: 'POST',
                url: form.attr('action'),
                data: form.serialize(),
                dataType: 'json',
                success: function(data) {
                    var type,
                        callback;

                    switch (data['validator']) {
                        case true:
                            type = 'success';
                            callback = data['message'];

                            form.get(0).reset();

                            break;
                        case false:
                            type = 'danger';
                            callback = '<ul>';

                            for (key in data['message']) {
                                callback += '<li>' + data['message'][key] +'</li>';
                            }
                            callback += '</ul>';

                            break;
                    }
                    var html =  '<div class="alert alert-' + type +'">';
                        html += '<a href="#" class="close" data-dismiss="alert">&times;</a>' + callback;
                        html += '</div>';

                    form.prev('.alert').remove();

                    form.before(html);
                }
            });
        });

        $(document).on('click', '.read-more .ajax', function(event) {
            event.preventDefault();

            var path = $(this).data('path');

            $('#modal .modal-content').load(path, function() {
                $('#modal').modal('show');
            });
        });


        $(document).on('click', '.popup.ajax', function(event) {
            event.preventDefault();

            var path = $(this).data('path');

            $('#modal .modal-content').load(path, function() {
                $('#modal').modal('show');
            });
        });

        $(document).on('click', '.load-more.ajax a', function(event) {
            event.preventDefault();

            var page   = $(this).attr('href').split('page=')[1],
                block  = $(this).closest('.block'),
                button = $(this);

            loadMore(page, block, button);
        });

        function loadMore(page, block, button) {
            $(document).ajaxStart(function() {
                button.attr('disabled', true);
                button.find('.ajax-progress').remove();
                button.append(
                    '<span class="ajax-progress">&nbsp;<i class="fa fa-refresh fa-spin"></i><span>'
                );
            });

            $(document).ajaxComplete(function() {
                button.closest('nav').remove();
            });

            $.ajax({
                type: 'GET',
                url: '/ajax/reviews?page=' + page,
                success: function(data) {
                    $(block).find('.content').append(data);
                }
            });
        }
    });
}).call(this);
