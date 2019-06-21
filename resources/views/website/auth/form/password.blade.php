@if ($errors->any())
	<div class='text-center alert alert-info'>
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">{{icon('times')}}</button>
		{{icon('exclamation-circle', 'fa-3x')}}
		@foreach ( $errors->all() as $error)
			<p>{{ $error }}</p>
		@endforeach
	</div>
@endif
@if (session('status'))
	<div class="text-center alert alert-info">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">{{icon('times')}}</button>
		{{icon('exclamation-circle', 'fa-3x')}}
		<p>{!! session('status') !!}</p>
	</div>
@endif
<form method="POST" action="{{ url_locale('/password/email') }} " style="display: none;">
	{{ csrf_field() }}
	<div class="form-group">
		<input type="email" class="form-control" name="email" placeholder="{{ trans('website.email') }}" required>
	</div>
	<div class="form-group">
		<button type="submit" class="btn btn-primary btn-block">
			{{ trans('message.password_sent_reset_link') }}
		</button>
	</div>
</form>

<form method="POST" action="{{ url_locale('/password/phone') }} ">
	{{ csrf_field() }}
	<div class="form-group">
		<input type="phone" class="form-control" id="regi_mobile"  name="users[phone]" placeholder="{{ trans('website.phone') }}" required>
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
	<div class="form-group" id="newpassword" style="display: none;">
		<input type="text" class="form-control" id="regi_mobile"  name="users[password]" placeholder="请输入新密码" required>
	</div>

	@include('website.auth.form.code')

	<style>
	</style>
	<div class="form-group">
		<button type="submit" class="btn btn-primary btn-block"  id="idbutton" style="display: none">
			{{ trans('message.password_sent_reset_link') }}
		</button>

	</div>	<div id="yzbutton" class="btn btn-primary btn-block" style="color: #ffffff;">下一步</div>
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


	var yzbutton ='{{ url_locale('/password/phone') }}';
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