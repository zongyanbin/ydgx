@extends('website.common.header_layouts')
@section('content')

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
        <!--评论 begin-->
        <div class="list_comment_content">
            <div class="agile_wthree_inner_grids containera" >
                <div class="col-md-10 "  style="background-color: #FFFFFF; width: 100%">
{{--                    <h2>{{$post->title}}</h2>--}}
{{--                    <h4>{{$post->content}}</h4>--}}
{{--                    <hr>--}}
                    <br>
                    @include('comments.list',['collections'=>$comments['root']])
                    <h3>留下您的评论</h3>
                    @include('comments.form',['parentId'=>$post->id,'c_uid'=>$c_uid])
                </div>
            </div>
        </div><!--评论 end -->
    </div>


        @stop
