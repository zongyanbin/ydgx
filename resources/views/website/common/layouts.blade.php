<!DOCTYPE html>
<html lang="zxx">
<html lang="en" ng-app="topclassApp">
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
                <h2><a><iaria-hidden="true"></i><img src="http://img02.cuctv.com/M00/01/01/CgEBe10Mo8rVmU1dAAAcC_Ggj2M109.png" style="width: 13%"></a></h2>
            </div>
            <div class="col-md-8 botttom-nav-agileits">
                <ul class="nav-w3ls">
                    <li><a class="scroll" href="#home">主页</a></li>
                    <li><a class="scroll" href="#welcome">关于我们</a></li>
                </ul>
                <div class="w3l-social team_agile _icons">
                    <ul>
                        <link rel="stylesheet" href="//at.alicdn.com/t/font_1263311_irg0svc7pml.css">
                        <li><a href="#"><i class="fa iconfont icon-jinritoutiao"></i></a></li>
                        <li><a href="#"><i class="fa fa-qq"></i></a></li>
                        <li><a href="#"><i class="fa fa-weixin"></i></a></li>
                        <li><a href="#"><i class="fa fa-weibo"></i></a></li>

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
    <style>
        .css_arrow_left {
            right: 100%;
            border-right: 24px solid #f15a25 !important;
            border-left: 0;
            width: 14px;
            height: 28px;
        }

        .css_arrow_right {
            left: 100%;
            border-left: 24px solid #f15a25 !important;
            border-right: 0;
            width: 14px;
            height: 28px;
        }

        .navbar-nav ul li{ line-height: 1rem;}


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

        .navbar-nav ul li a {
            padding-top: 5px;
            padding-bottom: 5px;
        }
     </style>

</body>
</html>