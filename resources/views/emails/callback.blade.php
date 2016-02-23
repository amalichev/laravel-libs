<div style="width:680px">
    <h3>{{ trans('email.user_info') }}</h3>
    <table style="
        border-collapse: collapse;
        width: 100%;
        border-top: 1px solid #dddddd;
        border-left: 1px solid #dddddd;
        margin-bottom: 30px">
        <tr>
            <td style="
            vertical-align: top;
            width: 150px;
            padding: 7px;
            font-size: 12px;
            font-weight: bold;
            border-right: 1px solid #dddddd;
            border-bottom: 1px solid #dddddd;
            text-align: right">
                {{ trans('forms.name') }}:
            </td>
            <td style="
            padding:7px;
            font-size:12px;
            border-right:1px solid #dddddd;
            border-bottom:1px solid #dddddd;
            text-align:left">
                {{ $field_name }}
            </td>
        </tr>
        @unless(empty($field_email))
            <tr>
                <td style="
                vertical-align: top;
                width: 150px;
                padding: 7px;
                font-size: 12px;
                font-weight: bold;
                border-right: 1px solid #dddddd;
                border-bottom: 1px solid #dddddd;
                text-align: right">
                    E-mail:
                </td>
                <td style="
                padding:7px;
                font-size:12px;
                border-right:1px solid #dddddd;
                border-bottom:1px solid #dddddd;
                text-align:left">
                    {{ $field_email }}
                </td>
            </tr>
        @endunless
        <tr>
            <td style="
                vertical-align: top;
                width: 150px;
                padding: 7px;
                font-size: 12px;
                font-weight: bold;
                border-right: 1px solid #dddddd;
                border-bottom: 1px solid #dddddd;
                text-align: right">
                {{ trans('forms.phone') }}:
            </td>
            <td style="
                padding:7px;
                font-size:12px;
                border-right:1px solid #dddddd;
                border-bottom:1px solid #dddddd;
                text-align:left">
                {{ $field_phone }}
            </td>
        </tr>
    </table>
</div>