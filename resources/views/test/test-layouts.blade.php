<html>
<head>
    <title>test</title>
</head>
<body>
<div class="header">
@section('header')
        头部
@show
</div>
<div class="main">
    <div class="sider">
    @section('main')
            边部分
    @show
    </div>
    <div class="content">
        @yield('content','主要内容区域') <!--不可以扩展-->
    </div>
</div>
<div class="fotter">
@section('footer')
        底部
@show
</div>
</body>
</html>