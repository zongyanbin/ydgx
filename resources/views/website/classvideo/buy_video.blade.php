
@extends('website.common.layouts')
@section('content')
    <div id="team" class="team featured_services" style="margin-top: 10px;">
        <div class="container">
            <div class="wthree_head_section">
                <h3 class="agile_tittle"><i class="fa fa-bullhorn" aria-hidden="true"></i> <span>Video</span></h3
            </div>
            <div class="agile_wthree_inner_grids">
                @include('website.common.class_video_player')
                <div class="style_list">
                    <div class="container-fluid">
                        <div class="accordion" id="accordion2">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="jumbotron jum">
                                        <h1>课程名称及信息</h1>
                                        <p>课程名称及信息课程名称及信息课程名称及信息课程名称及信息课程名称及信息课程名称及信息课程名称及信息课程名称及信息</p>
                                    </div>
                                </div>
                                <div class="col-md-4 color_baise">
                                    <div class=kc_right>
                                        <p class="text-center">100RMB</p>
                                        <p class="text-center"><a href="{{url('class/pay')}}"><button type="button" class="btn btn-danger">购买课程</button></a></p>
                                    </div>
                                </div>
                            </div>
                            <div class="row color_baise type_bg" id="mainservice">
                                <div class="row ma10">
                                    <div class="col-sm-6 col-md-4">
                                        <div class="thumbnail type_bg_nr">
                                            <img class="img-responsive" src="http://www.topclassx.com/static/img/001.jpg" alt="">
                                            <div class="caption">
                                                <h3>课程介绍</h3>
                                                <p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</p>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-4">
                                        <div class="thumbnail type_bg_nr">
                                            <img class="img-responsive" src="http://www.topclassx.com/static/img/001.jpg" alt="">
                                            <div class="caption">
                                                <h3>课程材料</h3>
                                                <p>内容内容内容内容内容内容内容内容内容内容img内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-4">
                                        <div class="thumbnail type_bg_nr">
                                            <img class="img-responsive" src="http://www.topclassx.com/static/img/001.jpg" alt="">
                                            <div class="caption">
                                                <h3>讨论内容</h3>
                                                <p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</p>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row jum padding08">
                                <h4>课程内容</h4>
                                <p>1</p>
                                <p>2</p>
                                <p>3</p>
                                <p>4</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
@stop


