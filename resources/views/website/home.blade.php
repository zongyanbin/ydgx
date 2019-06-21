@extends('website.common.layouts')
@section('slide')
    @include('website.common.new_slide')
@stop
@section('content')

    <!-- /about -->
    <div class="about" id="welcome">
        <div class="container">
            <div class="wthree_head_section">
                <h2>网站功能介绍</h2>
                <h3 class="agile_tittle"><em class="" aria-hidden="true"></em> <span>About</span>仰大公学</h3>
            </div>
            <div class="agile_wthree_inner_grids">

                <div class="col-md-6 about_agileinfo">
                    <h4>标题</h4>
                    简介
                 <div style="display: none">
                     <p><a href="personal.html">编辑个人资料</a></p>
                     <p><a href="update_password.html">修改密码</a></p>
                     <p><a href="comments.html">课程观看及评论页面</a></p>
                     <p><a href="mobile_login.html">手机登录页面</a></p>
                     <p><a href="pay.html">支付页面</a></p>
                     <p><a href="info.html">个人主页</a></p>
                     <p><a href="w-list.html">课程页面（未购买）</a></p>
                     <p><a href="list.html">课程页面（已购买）</a></p>
                     <p><a href="my_courses.html">我的课程</a></p>
                 </div>
                    <div class="agileits-button two">
                        <a class="btn btn-primary btn-lg scroll" data-toggle="modal" data-target="#myModal4" href="#" role="button">Read More »</a>
                    </div>
                </div>
                <div class="col-md-6 about_agileinfo_grid_imgs">
                    <img src="{{asset('static/images/banner1.jpg')}}" alt="" />
                    <img src="{{asset('static/images/banner6.jpg')}}" alt="" />
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!-- Modal4 -->
    <div class="modal fade" id="myModal4" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <div class="modal-info">
                        <h4>正文标题</h4>
                        <img src="images/banner2.jpg" alt=" " class="img-responsive" />
                        <h5>副标题</h5>
                        <p class="para-agileits-w3layouts">内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
                            内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
                            内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
                            内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- //Modal4 -->

    <!--//about -->


    <!-- team -->
    <div id="team" class="team featured_services">
        <div class="container">
            <div class="wthree_head_section">
                <h3 class="agile_tittle"><i class="" aria-hidden="true"></i> <span>Video</span>精彩课程</h3>
            </div>
            <div class="agile_wthree_inner_grids">


                <div class="col-sm-6" data-segment-action="aaron-franklin-teaches-texas-style-bbq" data-segment-instructor-tile-trigger="true">
                    <a id="aaron-franklin-teaches-texas-style-bbq" href="#">
                        <div class="mc-tile mc-tile--16x9">
                            <div class="mc-tile__content">
                                <div class="mc-tile__component mc-tile-image"><div class="mc-tile-image__image mc-background mc-background--loaded mc-background--position-x-center mc-background--position-y-center mc-background--fit-container mc-background--size-cover mc-background--size-cover-width"><div class="mc-background__background-container">
                                            <img class="mc-background__background error" data-src="{{asset('static/img/001.jpg')}}" src="{{asset('static/img/001.jpg')}}" data-was-processed="true"></div></div></div>
                                <div class="mc-tile__component mc-tile-overlay mc-tile-overlay--gradient-bottom"></div><div class="mc-tile__component mc-tile-caption mc-tile-caption--x-left mc-tile-caption--y-bottom"><div class="mc-tile-caption__content mc-p-3">
                                        <h5 class="mc-text-h5 mc-text--uppercase">标题</h5>
                                        <h6 class="mc-text-h6 mc-text--airy mc-text--muted">内容</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>




                <div class="col-sm-6" data-segment-action="aaron-franklin-teaches-texas-style-bbq" data-segment-instructor-tile-trigger="true">
                    <a id="aaron-franklin-teaches-texas-style-bbq" href="#">
                        <div class="mc-tile mc-tile--16x9">
                            <div class="mc-tile__content">
                                <div class="mc-tile__component mc-tile-image"><div class="mc-tile-image__image mc-background mc-background--loaded mc-background--position-x-center mc-background--position-y-center mc-background--fit-container mc-background--size-cover mc-background--size-cover-width"><div class="mc-background__background-container">
                                            <img class="mc-background__background error" data-src="{{asset('static/img/004.jpg')}}" src="{{asset('static/img/004.jpg')}}" data-was-processed="true"></div></div></div>
                                <div class="mc-tile__component mc-tile-overlay mc-tile-overlay--gradient-bottom"></div><div class="mc-tile__component mc-tile-caption mc-tile-caption--x-left mc-tile-caption--y-bottom"><div class="mc-tile-caption__content mc-p-3">
                                        <h5 class="mc-text-h5 mc-text--uppercase">标题</h5>
                                        <h6 class="mc-text-h6 mc-text--airy mc-text--muted">内容</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>



                <div class="col-sm-6" data-segment-action="aaron-franklin-teaches-texas-style-bbq" data-segment-instructor-tile-trigger="true">
                    <a id="aaron-franklin-teaches-texas-style-bbq" href="#">
                        <div class="mc-tile mc-tile--16x9">
                            <div class="mc-tile__content">
                                <div class="mc-tile__component mc-tile-image"><div class="mc-tile-image__image mc-background mc-background--loaded mc-background--position-x-center mc-background--position-y-center mc-background--fit-container mc-background--size-cover mc-background--size-cover-width"><div class="mc-background__background-container">
                                            <img class="mc-background__background error" data-src="{{asset('static/img/005.jpg')}}" src="{{asset('static/img/005.jpg')}}" data-was-processed="true"></div></div></div>
                                <div class="mc-tile__component mc-tile-overlay mc-tile-overlay--gradient-bottom"></div><div class="mc-tile__component mc-tile-caption mc-tile-caption--x-left mc-tile-caption--y-bottom"><div class="mc-tile-caption__content mc-p-3">
                                        <h5 class="mc-text-h5 mc-text--uppercase">标题</h5>
                                        <h6 class="mc-text-h6 mc-text--airy mc-text--muted">内容</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>





                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
@stop

