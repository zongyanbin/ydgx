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


    <script type="text/javascript" src="{{asset('static/code/tn_code.js')}}"></script>
    <link rel="stylesheet" type="text/css" href="{{asset('static/code/style.css?v=27')}}" />
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1263311_aqv4goknkgv.css">

</head>
<body>
<div class="banner_top" id="home">
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
        margin-left: 4.5%;
        width: 70%; margin-top: 1rem; text-align: center; float: left;
    }
    /*媒体查询：注意and后面空格的添加*/
    /*iphone: w < 768px*/
    @media screen and (max-width: 768px){
        .logo_center{
            margin-left: 2%;
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
<div class="w3l_footer">
    <div class="container">
        <div class="col-md-4">
            <h2><a><iaria-hidden="true"></i><img src="http://img02.cuctv.com/M00/01/01/CgEBe10Mo8rVmU1dAAAcC_Ggj2M109.png" style="width: 13%"></a></h2>
        </div>
        <div class="col-md-8 botttom-nav-agileits">
            <ul class="nav-w3ls">
                <li><a class="scroll" href="#home">主页</a></li>
                <li><a class="scroll" href="#welcome">关于我们</a></li>
            </ul>
            <div class="w3l-social team_agile _icons">
                <ul>
                    <li><a href="#"><i class="fa iconfont icon-jinritoutiao"></i></a></li>
                    <li><a href="#"><i class="fa fa-qq"></i></a></li>
                    <li><a href="#"><i class="fa fa-weixin"></i></a></li>
                    <li><a href="#"><i class="fa fa-weibo"></i></a></li>
                    <html lang="zxx">
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
        <p class="agileits_w3ls_copyright">Copyright &copy; 2019.Company name All rights 技术维护：中传视友</p>
        <div class="arrow-container animated fadeInDown">
            <a href="#home" class="arrow-2 scroll">
                <i class="fa fa-angle-up"></i>
            </a>
            <div class="arrow-1 animated hinge infinite zoomIn"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
            }, 1000);
        });
    });



    function  arrow_left(){
        $('.mc-arrow-left').toggleClass("css_arrow_left");
        setTimeout(function () {
            $('.mc-arrow-left').removeClass("css_arrow_left");
        }, 300);
    }
    function  arrow_right(){
        $('.mc-arrow-right').toggleClass("css_arrow_right");
        setTimeout(function () {
            $('.mc-arrow-right').removeClass("css_arrow_right");
        }, 300);
    }

    $(function(){
        $('.dropdown').mouseover(function() {
            $(this).addClass('open');    }).mouseout(function() {        $(this).removeClass('open');    });
    });

</script>
</div>
</body>
</html>