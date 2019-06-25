@extends('website.common.header_layouts')

        @section('content')
            <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
            <div class="container" style="margin-top: 100px">
                <div class="col-md-10 col-md-offset-1">
                    <h2>{{$post->title}}</h2>
                    <h4>{{$post->content}}</h4>
                    <hr>
                    @include('comments.list',['collections'=>$comments['root']])
                    <h3>留下您的评论</h3>
                    @include('comments.form',['parentId'=>$post->id])
                </div>
            </div>
        @stop
