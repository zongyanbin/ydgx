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
                <div class="">
                    <video id="my-player" class="video-js vjs-fluid vjs-big-play-centered" controls preload="auto" poster="http://vjs.zencdn.net/v/oceans.png"
                           data-setup='{}'>
                        <source src="http://vjs.zencdn.net/v/oceans.mp4" type="video/mp4"></source>
                        <source src="http://vjs.zencdn.net/v/oceans.webm" type="video/webm"></source>
                        <source src="http://vjs.zencdn.net/v/oceans.ogv" type="video/ogg"></source>
                        <p class="vjs-no-js">
                            To view this video please enable JavaScript, and consider upgrading to a
                            web browser that
                            <a href="http://videojs.com/html5-video-support/" target="_blank">
                                supports HTML5 video
                            </a>
                        </p>
                    </video>
                </div>




                <div class="style_list">
                    <h3 class="agile_tittle">课程内容</h3>
                    <div class="style_list_line"></div>


                    <div class="container-fluid">
                        <div class="accordion" id="accordion2">
                            <div class="accordion-group Fold_demo">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle " data-toggle="collapse" data-parent="#accordion2" href="#collapse1">
                                        <h4><span class="glyphicon glyphicon-triangle-right">第一节课</span></h4>
                                    </a>
                                </div>
                                <div id="collapse1" class="accordion-body collapse" style="height: 0px; ">
                                    <div class="accordion-inner">
                                        <a>视频连接</a><br>
                                        <a>pdf下载</a>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse2">

                                        <h4><span class="glyphicon glyphicon-triangle-right">第二节课</span></h4>
                                    </a>
                                </div>
                                <div id="collapse2" class="accordion-body collapse" style="height: 0px; ">
                                    <div class="accordion-inner">
                                        <a href="http//www.baidu.com">视频连接</a><br>
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