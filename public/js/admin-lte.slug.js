(function() {
    jQuery(function($) {
        if ($('input').is('#slug') && $('input').is('#title')) {
            if(!$('input#slug').val()) {
                function translit() {
                    var space = '-';
                    var text = $('input#title').val().toLowerCase();

                    var transl = {
                        'а': 'a',
                        'б': 'b',
                        'в': 'v',
                        'г': 'g',
                        'д': 'd',
                        'е': 'e',
                        'ё': 'e',
                        'ж': 'zh',
                        'з': 'z',
                        'и': 'i',
                        'й': 'j',
                        'к': 'k',
                        'л': 'l',
                        'м': 'm',
                        'н': 'n',
                        'о': 'o',
                        'п': 'p',
                        'р': 'r',
                        'с': 's',
                        'т': 't',
                        'у': 'u',
                        'ф': 'f',
                        'х': 'h',
                        'ц': 'c',
                        'ч': 'ch',
                        'ш': 'sh',
                        'щ': 'sh',
                        'ъ': '',
                        'ы': 'y',
                        'ь': '',
                        'э': 'e',
                        'ю': 'yu',
                        'я': 'ya',
                        ' ': space,
                        '_': space,
                        '`': space,
                        '~': space,
                        '!': space,
                        '@': space,
                        '#': space,
                        '$': space,
                        '%': space,
                        '^': space,
                        '&': space,
                        '*': space,
                        '(': space,
                        ')': space,
                        '-': space,
                        '\=': space,
                        '+': space,
                        '[': space,
                        ']': space,
                        '\\': space,
                        '|': space,
                        '/': space,
                        '.': space,
                        ',': space,
                        '{': space,
                        '}': space,
                        '\'': space,
                        '"': space,
                        ';': space,
                        ':': space,
                        '?': space,
                        '<': space,
                        '>': space,
                        '№': space
                    }
                    var result = '';
                    var curent_sim = '';

                    for (i = 0; i < text.length; i++) {
                        if (transl[text[i]] != undefined) {
                            if (curent_sim != transl[text[i]] || curent_sim != space) {
                                result += transl[text[i]];
                                curent_sim = transl[text[i]];
                            }
                        }
                        else {
                            result += text[i];
                            curent_sim = text[i];
                        }
                    }
                    result = TrimStr(result);

                    $('input#slug').val(result);
                }

                function TrimStr(s) {
                    s = s.replace(/^-/, '');
                    return s.replace(/-$/, '');
                }

                $(function () {
                    $('input#title').keyup(function () {
                        translit();
                        return false;
                    });
                });
            }
        }
    });
}).call(this);
