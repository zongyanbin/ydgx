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
    <link rel="stylesheet" href="{{ mix('website/css/app.css') }}">
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
<!-- js for portfolio lightbox -->
<script src="{{asset('static/js/jquery.chocolat.js ')}}"></script>
<link rel="stylesheet " href="{{asset('static/css/chocolat.css')}} " type="text/css" media="all" />
<!--light-box-files -->

<!-- /js for portfolio lightbox -->
<!-- stats
<script src="{{asset('static/js/jquery.waypoints.min.js')}}"></script>
<script src="{{asset('static/js/jquery.countup.js')}}"></script>
<script type="text/javascript" src="{{asset('static/js/jquery-2.1.4.min.js')}}"></script>
-->
<!-- //stats -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="{{asset('static/js/move-top.js')}}"></script>
<script type="text/javascript" src="{{asset('static/js/easing.js')}}"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
            }, 1000);
        });
    });
</script>

<!-- requried-jsfiles-for owl -->

<script type="text/javascript" src="{{asset('static/js/bootstrap-3.1.1.min.js')}}"></script>
</body>
</html>