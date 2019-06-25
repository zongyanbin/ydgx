<nav class="nav navbar-inverse bg_ch navbar-fixed-top color_black">
	<div class="container">
		<div class="navbar-header">
			<!--在移动端的时候导航条折叠起来，三横的样式出现，点击该样式可以显示或隐藏导航条上的内容-->
			<button class="navbar-toggle" data-toggle="collapse" data-target="#menu">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a href="{{url('/')}}" class="navbar-brand center-block"><img src="http://img02.cuctv.com/M00/01/01/CgEBe10Mo8rVmU1dAAAcC_Ggj2M109.png" alt="仰大公学" style="width: 50%"></a>
			<div style=" margin-top: 1.5rem; float: left; text-align: center;"></div>
		</div>
		<a href="{{url('/')}}"><div class="center-block logo_center"><img src="{{asset('static/images/logopng.png')}}" width="150px;"></div></a>
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
						<li><a href="{{url('users/personal')}}">用户信息</a></li>
						<li><a href="{{url('users/my_courses')}}">我的课程</a></li>
						<li><a href="{{url('users/reset')}}">重置密码</a></li>
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
<style>
	.logo_center{
		width: 75%; margin-top: 1rem; text-align: center; float: left;
	}
	/*媒体查询：注意and后面空格的添加*/
	/*iphone: w < 768px*/
	@media screen and (max-width: 768px){
		.logo_center{
			margin-top: -3rem;
			width:90%;
		}
	}
	/*pad: w >= 768  && w< 992*/
	@media screen and (max-width: 992px) and (min-width: 768px) {
		.logo_center{
			margin-top: -3rem;
			width:750px;
		}
	}
	/*中等屏幕   w >= 992  && w<1200*/
	@media screen and (max-width: 1200px) and (min-width: 992px) {
		.logo_center{
			margin-top: -3rem;
			width:970px;
		}
	}
</style>




