@extends('website.common.layouts')
@section('content')
    <!-- team -->
    <div id="home"></div>
    <div id="team" class="team featured_services" style="margin-top: 10px;">
        <div class="container">
            <div class="wthree_head_section">
                <h3 class="agile_tittle"><i class="fa fa-bullhorn" aria-hidden="true"></i> <span>Video</span></h3>
            </div>
            <div class="agile_wthree_inner_grids">
                @include('website.common.class_video_player')




                <div class="style_list">
                    <h3 class="agile_tittle">课程内容</h3>
                    <div class="style_list_line"></div>


                    <div class="container-fluid">
                        <div class="accordion" id="accordion2">
                            <div class="accordion-group mt-2 Fold_demo">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle " data-toggle="collapse" data-parent="#accordion2" href="#collapse1">
                                        <h4><span class="glyphicon glyphicon-triangle-right">第一节课</span></h4>
                                    </a>
                                </div>
                                <div id="collapse1" class="accordion-body collapse" style="height: 0px; ">
                                    <div class="accordion-inner mt-2">
                                        <a href="{{asset('/post/show/1')}}">视频连接</a><br>
                                        <a>pdf下载</a>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-group mt-2">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse2">

                                        <h4><span class="glyphicon glyphicon-triangle-right">第二节课</span></h4>
                                    </a>
                                </div>
                                <div id="collapse2" class="accordion-body collapse" style="height: 0px; ">
                                    <div class="accordion-inner mt-2">
                                        <a href="{{asset('/post/show/1')}}">视频连接</a><br>
                                        <a>pdf下载</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>


                </div>

                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
@stop