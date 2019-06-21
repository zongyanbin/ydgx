@inject('pages','App\Article')
        <!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml" xml:lang="{!! LaravelLocalization::getCurrentLocale() !!}" lang="{!! LaravelLocalization::getCurrentLocale() !!}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="GFstudio" />
    <meta name="google-site-verification" content="" />


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="{{ mix('website/css/vendor.css') }}">
    <link rel="stylesheet" href="{{ mix('website/css/app.css') }}">

<style>
    html ,body{
        color:#333333 ;
        background-color: #333333;
    }
</style>
<body>
<main class=" width:100%">
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-sm-push-3 col-md-4 col-md-push-4">
            <h1 class="text-center">登录</h1>
            @include('website.auth.form.login')
        </div>
    </div>
</main>

</body>
</html>


