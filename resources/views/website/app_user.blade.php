@inject('pages','App\Article')
        <!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml" xml:lang="{!! LaravelLocalization::getCurrentLocale() !!}" lang="{!! LaravelLocalization::getCurrentLocale() !!}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="GFstudio" />
    <meta name="google-site-verification" content="" />

    <!-- Meta SEO -->
    {!! SEO::generate() !!}

    <meta property="og:url" content="{!! rtrim(LaravelLocalization::getLocalizedURL(LaravelLocalization::getCurrentLocale()), '/') !!}" />

    <link rel="icon" href="{!! asset('website/images/icon.png') !!}" type="image/PNG">


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="{{ mix('website/css/vendor.css') }}">
    <link rel="stylesheet" href="{{ mix('website/css/app.css') }}">
    <style>
        html, body {
            background-color: #333333;
        }
        .disabled_code {
            pointer-events: none;
            cursor: default;
            opacity: 0.6;
            color: red;
        }
    </style>
    @include('website.partials.widgets_mobile_app')

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    {{-- GA --}}
    @include('website.partials.widgets_ga')

    {{-- captcha --}}
    @include('website.partials.widgets_captcha')

    {{-- iubenda --}}
    {{-- @include('website.partials.iubenda_banner') --}}


    <script type="text/javascript" src="{{asset('static/code/tn_code.js')}}"></script>
    <link rel="stylesheet" type="text/css" href="{{asset('static/code/style.css?v=27')}}" />
</head>
<body>

@yield('content')

{{-- default js to show in all pages --}}
<script type="text/javascript">
    var urlAjaxHandler  = "{{ url_locale('/') }}";
    var _LANG           = "{{ get_locale() }}";
    var _WEBSITE_NAME	= "{!! config('maguttiCms.website.option.app.name')!!}";
    var imageScroll     = "{!! asset(config('maguttiCms.admin.path.assets').'website/images/up.png') !!}";
    window.Laravel = <?php echo json_encode(['csrfToken' => csrf_token()]); ?>;
    @if (store_enabled())
        window.StoreConfig = {
        decimals: {{config('maguttiCms.store.formatting.decimals')}},
        decimal_separator: '{{config('maguttiCms.store.formatting.decimal_separator')}}',
        thousands_separator: '{{config('maguttiCms.store.formatting.thousands_separator')}}',
        prepend_currency: {{config('maguttiCms.store.formatting.prepend_currency')}},
        append_currency: {{config('maguttiCms.store.formatting.append_currency')}},
        currency_symbol: '{{config('maguttiCms.store.currency_symbol')}}'
    };
    @endif
</script>

@include('website.partials.js_localization')

<!-- JS Implementing Plugins -->
<script type="text/javascript" src="{{ mix('/website/js/vendor.js') }}"></script>
<script type="text/javascript" src="{{ mix('/website/js/app.js') }}"></script>
<script type="text/javascript">
    $(document).ready(function() {
        App.init();
    });
</script>
@if (store_enabled())
    <script type="text/javascript" src="{{ mix('/website/js/store.js') }}"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            Store.init();
        });
    </script>
@endif

{{-- iubenda --}}
@include('website.partials.iubenda_policies')

@include('website.partials.widgets_cookie')
<!-- JS Implementing Plugins -->
@yield('footerjs')
</body>
</html>
