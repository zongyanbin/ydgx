<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>仰大公学</title>
    <!-- custom-theme -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
<style>
    #showEdit{ margin-top: 5rem;}
</style>
    <link rel="stylesheet" href="{{ mix('website/css/vendor.css') }}">
<!--<link rel="stylesheet" href="{{ mix('website/css/app.css') }}"> -->
    <!-- JS Implementing Plugins -->

    <!-- //custom-theme -->
    <link href="{{asset('static/css/bootstrap.css')}}" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="{{asset('static/css/slider.css')}}" type="text/css" media="screen" property="" />
    <link href="{{asset('static/css/style7.css')}}" rel="stylesheet" type="text/css" media="all" />
    <!-- Owl-carousel-CSS -->
    <link href="{{asset('static/css/owl.carousel.css')}}" rel="stylesheet">

    <link rel="stylesheet" href="{{asset('static/css/team.css')}}" type="text/css" media="all" />
    <link href="{{asset('static/css/style.css')}}" rel="stylesheet" type="text/css" media="all" />
    <!-- font-awesome-icons -->
    <link href="{{asset('static/css/font-awesome.css')}}" rel="stylesheet">

</head>
<body>
@include('website.common.navbar')
@yield('content')

<!-- //js -->
<script src="{{asset('static/js/modernizr-2.6.2.min.js')}}"></script>
<script src="{{asset('static/js/classie.js')}}"></script>
<!-- //nav -->


<!-- //stats -->

@section('js')
    <script type="text/javascript" src="{{asset('static/js/jquery-2.1.4.min.js')}}"></script>
    　　@show

<!-- requried-jsfiles-for owl -->
<script type="text/javascript" src="{{asset('static/js/bootstrap-3.1.1.min.js')}}"></script>
<style>
    .navbar-nav ul li a {
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .logo_center{
        width: 70%; margin-top: 1rem; text-align: center; float: left;
    }
    /*媒体查询：注意and后面空格的添加*/
    /*iphone: w < 768px*/
    @media screen and (max-width: 768px){
        .logo_center{
            margin-top: -3rem;
            width:100%;
        }
    }
    /*pad: w >= 768  && w< 992*/
    @media screen and (max-width: 992px) and (min-width: 768px) {
        .logo_center{
            margin-top: -3rem;
            width:750px;
        }
    }
    /*中等屏幕   w >= 992  && w<1200*/
    @media screen and (max-width: 1200px) and (min-width: 992px) {
        .logo_center{
            margin-top: -3rem;
            width:970px;
        }
    }
</style>
<script>
    $(function(){
        $('.dropdown').mouseover(function() {
            $(this).addClass('open');    }).mouseout(function() {        $(this).removeClass('open');    });
    });

</script>
</body>
</html>