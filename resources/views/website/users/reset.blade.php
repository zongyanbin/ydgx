@extends('website.common.header_layouts')
 <!--||$errors->any()-->
@if (false)
    <div class='text-center alert alert-info'>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">{{icon('times')}}</button>
        {{icon('exclamation-circle', 'fa-3x')}}

        @foreach ( $errors->all() as $error)
            <p>{{ $error }}</p>
        @endforeach
    </div>
@endif
@section('content')
    <script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
    <main class=" width:100%"  style="color: #ffffff;">

        <div class="row">
            <div class="col-xs-12 col-sm-6 col-sm-push-3 col-md-4 col-md-push-4">

                <form class="login-form" action="" method="post">
                    <h3 class="font-green text-center" style="margin: 2rem;">修改密码</h3>

                    @if($errors->first())
                        @if ($errors->any())
                            <div class='text-center alert alert-info'>
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">{{icon('times')}}</button>
                                {{icon('exclamation-circle', 'fa-3x')}}

                                @foreach ( $errors->all() as $error)
                                    <p>{{ $error }}</p>
                                @endforeach

                            </div>
                        @endif

                    @endif

                    @include('website.common.message')
                    {!! csrf_field() !!}

                    <div id="newpassword">
                    <div class="form-group">
                        <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="原始密码" name="oldpassword"> </div>


                    <div class="form-group">
                        <input class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_password" placeholder="新密码" name="password"> </div>
                    <div class="form-group">
                        <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="确认密码" name="password_confirmation"> </div>
                    </div>


                    <div class="form-group">
                        <input type="phone" class="form-control" id="regi_mobile"  name="users[phone]" value="{{$user_phone}}" disabled="true" placeholder="{{ trans('website.phone') }}" required>
                    </div>
                    <div class="form-group" id="code_reg">
                        <div class="row">
                            <div class="col-xs-7 col-sm-7 col-md-7 ">
                                <input type="hidden" id="isno" value="1">
                                <input class="code form-control"  placeholder="手机验证码"  id="validatecode" type="text" name="authnum">
                            </div>
                            <div class="col-xs-4 col-md-4 col-sm-4">
                                <input class="btn btn-danger" id="btn"  value="免费获取验证码" type="button" onclick="duanxin()" />

                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <button type="submit" class="btn btn-danger btn-block"  id="idbutton" >
                            {{ trans('message.password_sent_reset_link') }}
                        </button>

                    </div>

                </form>
            </div>
        </div>
    </main>


    <script type="text/javascript">
        var countdown=60;
        function sendemail(){
            var obj = $("#btn");
            settime(obj);

        }
        function settime(obj) { //发送验证码倒计时

            if (countdown == 0) {
                obj.attr('disabled',false);
                //obj.removeattr("disabled");
                obj.val("免费获取验证码");
                countdown = 60;
                return;
            } else {
                obj.attr('disabled',true);
                obj.val("重新发送(" + countdown + ")");
                countdown--;
            }
            setTimeout(function() {
                    settime(obj) }
                ,1000)
        }


        function duanxin() {
            //获取手机ID
            var iphone = $("#regi_mobile").val();
            if ($("#regi_mobile").val() == "") {
                alert("手机号码不能为空！");
                //$("#moileMsg").html("<font color='red'>手机号码不能为空！</font>");
                $("#tel").focus();
                return false;
            }
            //        var pattern = /^1[34578]\d{9}$/;
            if (!$("#regi_mobile").val().match(/^1[34578]\d{9}$/)) {
                alert("手机号码格式不正确！");
                //$("#moileMsg").html("<font color='red'>手机号码格式不正确！请重新输入！</font>");
                $("#tel").focus();
                return false;
            }

            var getcode ="{{url('getcode')}}";
            $.ajax({
                url: 'getcode',
                data: {'iphone': iphone,'type':2},
                type: "GET",
                dataType: 'json',
                success: function (msg) {
                    var msg= msg['msg'];
                    if (msg['stat'] == '100') {
                        alert(msg['message']);
                        sendemail()
                    } else {
                        alert(msg['message']);
                    }

                }
            });
        }
        $("#yzbutton").click(function () {
            var iphone = $("#regi_mobile").val();
            var valcode = $("#validatecode").val();
            //获取手机ID
            var iphone = $("#regi_mobile").val();
            if ($("#regi_mobile").val() == "") {
                alert("手机号码不能为空！");
                //$("#moileMsg").html("<font color='red'>手机号码不能为空！</font>");
                $("#tel").focus();
                return false;
            }
            //        var pattern = /^1[34578]\d{9}$/;
            if (!$("#regi_mobile").val().match(/^1[34578]\d{9}$/)) {
                alert("手机号码格式不正确！");
                //$("#moileMsg").html("<font color='red'>手机号码格式不正确！请重新输入！</font>");
                $("#tel").focus();
                return false;
            }


            var yzbutton ='{{ url_locale('/users/reset') }}';
            $.ajax({
                url: yzbutton,
                data: {'iphone': iphone,'authnum':valcode,'_token': '{{ csrf_token() }}'},
                type: "POST",
                dataType: 'json',
                success: function (msg) {
                    var msg= msg['msg'];
                    if (msg['stat'] == '100') {
                        alert(msg['message']);
                        $("#idbutton").show();
                        $("#code_reg").hide();
                        $("#yzbutton").hide();
                        $("#newpassword").show();
                        $(".tncode").hide();
                        //sendemail()
                    } else {
                        alert(msg['message']);
                    }

                }
            });
        });

    </script>
@stop
