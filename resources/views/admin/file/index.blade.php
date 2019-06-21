@extends('admin.master')
<html>
<head>
    <title></title>
</head>
<body style="text-align:center">
<script src="https://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>

@section('content')

    <div class="panel panel-default">
        <div class="panel-heading">文件上传</div>
        <div class="panel-body">
            <form class="form-horizontal" role="form" method="POST" action="" enctype="multipart/form-data">
                {{ csrf_field() }}
                <div class="form-group">
                    <div class="">
                        <input id="file" type="file" class="form-control" name="source">
                          <button type="submit" class="btn btn-primary"  style="width: 20% ; margin-top: 2rem;"> 提交 </button>
                    </div>
                </div>

            </form>
        </div>
    </div>




@stop
</body>
</html>
