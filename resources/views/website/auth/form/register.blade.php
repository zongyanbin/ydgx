@include('flash::notification')
<form method="post" action="{{url_locale('register')}}" id="actionForm">
	{!! csrf_field() !!}
	@if (isset($redirectTo))
		<input type="hidden" name="redirectTo" value="{{$redirectTo}}">
	@endif
	<div class="form-group">
		<input type="text" class="form-control" id="regi_mobile" placeholder="{{ trans('website.phone') }}" name="phone" value="{{ old('phone') }}" required>
	</div>

	<div class="form-group">
		<input type="password" class="form-control" name="password" placeholder="{{ trans('website.password') }}" required>
		<input type="password" class="form-control" name="password_confirmation" placeholder="{{ trans('message.password_confirm') }}" required>

		<div class="alert alert-info">
			{{trans('website.message.password')}}
		</div>
	</div>


	<div class="form-group" id="code_reg" style="display: none;">
		<div class="row">
			<div class="col-xs-7 col-sm-7 col-md-7 ">
				<input type="hidden" id="isno" value="1">
				<input class="code form-control"  placeholder="手机验证码"  id="validatecode" type="text" name="authnum">
			</div>
			<div class="col-xs-4 col-md-4 col-sm-4">
				<input class="btn btn-primary" id="btn"  value="免费获取验证码" type="button" onclick="duanxin()" />

			</div>
		</div>
	</div>
	@include('website.auth.form.code')

	<div class="form-group">
		<button type="submit" class="btn btn-primary btn-block" id="action-btn">
			{{ trans('message.register') }}
		</button>
	</div>
</form>
<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
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

		var getcode ='{{url('getcode')}}';
		$.ajax({
			url: 'getcode',
			data: {'iphone': iphone},
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


</script>