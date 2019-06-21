<!DOCTYPE html>
<html lang="zxx">
<html lang="en" ng-app="masterclassApp">
<head  data-ambient-video-vendor="brightcove"  data-controller-action="root" data-controller-name="pages"  data-talkable-campaign="" data-user="{}" >





    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <title>仰大公学</title>
    <!-- custom-theme -->

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />

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
<div class="banner_top" id="home">
    @section('slide')
    @show
    @yield('content')

    <div class="w3l_footer">
        <div class="container">
            <div class="col-md-4">
                <h2><a><iaria-hidden="true"></i><img src="http://img02.cuctv.com/M00/01/01/CgEBe10Mo8rVmU1dAAAcC_Ggj2M109.png"></a></h2>
            </div>
            <div class="col-md-8 botttom-nav-agileits">
                <ul class="nav-w3ls">
                    <li><a class="scroll" href="#home">主页</a></li>
                    <li><a class="scroll" href="#welcome">关于我们</a></li>
                </ul>
                <div class="w3l-social team_agile _icons">
                    <ul>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
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
    <!--//footer -->
        @section('js')
            <script type="text/javascript" src="{{asset('static/js/jquery-2.1.4.min.js')}}"></script>
    　　@show
    <!-- js -->
    <!-- //js -->

    <!-- //requried-jsfiles-for owl -->
    <script type="text/javascript" src="{{asset('static/js/bootstrap-3.1.1.min.js')}}"></script>


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
               $('.mc-arrow-left ').addClass("css_arrow_left");
            }


            $(function(){
               // $('.dropdown').mouseover(function() {
                 //   $(this).addClass('open');    }).mouseout(function() {        $(this).removeClass('open');    });
            });

        </script>
    <style>
        .css_arrow_left {
            right: 100%;
            border-right: 24px solid #f15a2 !important;
            border-left: 0;
            width: 14px;
            height: 28px;
            color: red;
        }

        arrow_right {
            right: 100%;
            border-right: 24px solid #f15a25 !important;
            border-left: 0;
            width: 14px;
            height: 28px;
        }

        .navbar-nav ul li{ line-height: 1rem;}
     </style>

</body>
</html>