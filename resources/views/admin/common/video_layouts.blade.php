<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>视频列表@yield('title')</title>
    <!-- Bootstrap CSS 文件 -->
    <link rel="stylesheet" href="{{ asset('static/bootstrap/css/bootstrap.min.css') }}">
    @section('style')
    @show
</head>
<body>

<!-- 头部 -->
@section('header')
    <div class="jumbotron">
        <div class="container">
            <h2>视频列表</h2>

            <p></p>
        </div>
    </div>

@show
<!-- 中间内容区局 -->
<div class="container">
    <div class="row">

        <!-- 左侧菜单区域   -->
        <div class="col-md-3">
            @section('leftmenu')
            <div class="list-group">
                <a href="#" class="list-group-item active">视频列表</a>
                <a href="/admin/upload" class="list-group-item"  target="_blank">新增视频</a>
            </div>
            @show
        </div>

        <!-- 右侧内容区域 -->
        <div class="col-md-9">


   @yield('content')

        </div>
    </div>
</div>

@section('footer')
<!-- 尾部 -->
<div class="jumbotron" style="margin:0;">
    <div class="container">
        <span>  @2016 </span>
    </div>
</div>
@show
<!-- jQuery 文件 -->
<script src="{{ asset('static/jquery/jquery.min.js') }}"></script>
<!-- Bootstrap JavaScript 文件 -->
<script src="{{ asset('static/bootstrap/js/bootstrap.min.js') }}"></script>

@section('javascript')
    @show
</body>
</html>