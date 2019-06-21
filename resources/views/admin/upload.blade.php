@extends('admin.master')
<html>
<head>
    <title></title>
</head>
<body style="text-align:center">
<script src="https://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
@section('content')
    <div class="pad-10">
        <script type="text/javascript">
            (function(){
                var ugc_login = function(){
                    var api = 'http://v.cuctv.com/ugc/check?uid={{$uid}}&refreshtoken={{ $accesstoken }}&mc=?';
                    $.getJSON(api,function(t){
                        if(t.result == 1){
                            $(".cont_nr").append('<iframe id="iframe_ID" name=iframe_ID width="100%" height="900" style="margin-top:-78px;" allowTransparency="true" frameborder="0" scrolling="no" src="http://v.cuctv.com/upload" ></iframe>');

                            var ifr = document.getElementById("iframe_ID");

                        }else{
                            alert('自动登录失败，请联系管理员');
                        }
                    });
                }();
            })();
        </script>
    </div>
@stop
</body>
</html>