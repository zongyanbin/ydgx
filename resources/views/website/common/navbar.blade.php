<nav class="nav navbar-inverse bg_ch navbar-fixed-top color_black">
	<div class="container">
		<div class="navbar-header">
			<!--在移动端的时候导航条折叠起来，三横的样式出现，点击该样式可以显示或隐藏导航条上的内容-->
			<button class="navbar-toggle" data-toggle="collapse" data-target="#menu">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a href="{{url('/')}}" class="navbar-brand"><img src="http://img02.cuctv.com/M00/01/01/CgEBe10Mo8rVmU1dAAAcC_Ggj2M109.png" alt="仰大公学" style="width: 50%"></a>
			<div style=" margin-top: 1.5rem; float: left; text-align: center;"><img src="{{asset('static/images/logopng.png')}}" width="150px;"></div>
		</div>

		<div id="menu" class="collapse navbar-collapse navbar-right">
			<ul class="nav navbar-nav ">

				{{-- login --}}
				@if (!Auth::guard()->check())
				<ul class="nav navbar-nav navbar-right">
					{{--<li><a href="{{url_locale('users/login')}}" data-toggle="modal" data-target="#login" href=""><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>--}}
                    {{--<li><a data-toggle="modal" data-target="#register" href=""><span class="glyphicon glyphicon-user"></span> 注册</a></li>--}}
					<li><a href="{{url_locale('users/login')}}"  data-target="#login" href=""><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
					<li><a data-target="#register" href="{{url_locale('register')}}"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                </ul>
				@else
				<li class="dropdown center">
					<A href="#" class="dropdown-toggle" data-toggle="dropdown">个人中心</A>
					</a>
					<ul class="dropdown-menu navbar-inverse nav navbar-nav">
						<li><a href="{{url('users/center')}}">用户中心</a></li>
					</ul>
				</li>
					<li  id="exit">
						<a href="{{url_locale('users/logout')}}">安全退出</a>
					</li>
				@endif

			</ul>
		</div>
	</div>
</nav>


<!-- 注册窗口 -->
<div id="register" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content" style="background-color: #333 !important">
			<div class="modal-body">
				<button class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-title">
				<h1 class="text-center">注册</h1>
			</div>
			<div class="modal-body">

				<div  class="form-group">
					<label for="">手机号码</label>
					<input class="form-control" type="text" id="regi_mobile" placeholder="手机号码">
				</div>
				<div class="form-group">
					<input class="form-control" type="password" id="password" placeholder="密码(密码应6-14，可包含英英文字母和数字)">
				</div>
				<div class="form-group">
					<input class="form-control" type="password" placeholder="确认密码">
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-md-8">
							<input class="code form-control" value="六位数字验证码" id="validatecode" type="text">
						</div>
						<div class="col-md-4">
							<input class="btn btn-primary" onclick='duanxin()' value="获取验证码" type="button">
						</div>
					</div>

				</div>
				<div class="text-right">
					<button id="tijiao" class="btn btn-primary" type="submit" onclick='tijiao()'>提交</button>
					<button class="btn btn-danger" data-dismiss="modal">取消</button>
				</div>
				<a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>手机号码
			</div>
		</div>
	</div>
</div>
<!-- 登录窗口 -->
<div id="login" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">

		</div>
	</div>
</div>
<script>
	function duanxin() {
		//获取手机ID
		var iphone = $("#regi_mobile").val();
		$.ajax({
			url: 'http://www.cms.com/en/register',
			data: {'iphone': iphone},
			type: "GET",
			dataType: "Json",
			success: function (msg) {
				if (msg['stat'] == '100') {
					alert('短信发送成功了');
				} else {
					alert('短信发送失败了');
				}

			}
		});
	}

function tijiao() {
	//获取手机ID
	var iphone = $("#regi_mobile").val();
	var password = $("#password").val();

	$.ajax({
		url: 'http://www.cms.com/en/register',
		data: {'iphone': iphone,'password':password},
		type: "GET",
		dataType: "Json",
		success: function (msg) {


		}
	});

}
</script>




