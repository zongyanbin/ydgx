@extends('website.common.header_layouts')
@section('content')

    <!--begin comment-->
    <link rel="stylesheet" href="{{asset('static/css/info.css')}}">
    <div class="container">
        <div class="wthree_head_section">
            <h3 class="agile_tittle"><i class="fa fa-bullhorn" aria-hidden="true"></i> <span>Video</span></h3>
            <div class="agile_wthree_inner_grids">
                @include('website.common.class_video_player')
                <div class="style_list">
                    <div class="style_list_comment">
                        <div class="row jum padding08">
                            <h4>课程内容</h4>
                            <p>这节课的标题以及内容简介</p>
                            <p>课程大纲</p>
                            <p>PDf文件</p>
                        </div>
                    </div>
                </div>


            </div>

            <div class="clearfix"> </div>
        </div>

    </div>

    <!--评论 begin-->
    <div class="list_comment_content" style=" width: 100%; height: -webkit-fill-available;">

        <meta name="csrf-token" content="{{ csrf_token() }}">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="{{asset('css/appvue.css')}}">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <div id="app">
            <div class="col-md-8 col-md-offset-2">
                <div class="row">
                    <div class="col-md-12" style="margin-top: 10px">
                        <div class="panel panel-default" style="display: none; margin-top: 2rem;">
                            <h2 style="padding: 0 20px">{{$post->title}}</h2>
                            <div class="panel-body">
                                <h4>{{$post->content}}</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <p></p>
                <h4>评论列表:</h4>
                <div class="row">
                    <div class="col-md-12">
                        <Comment_post :user_id="{{$c_uid ? $c_uid :0}}" :comments="{{$collections}}" :post_id="{{$post->id}}" :collections="{{$collections['root']}}"></Comment_post>
                    </div>
                </div>
            </div>
        </div>
        <script src="{{ mix('js/appvue.js') }}"></script>

    </div><!--评论 end -->

 @stop
