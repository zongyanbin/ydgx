@include('flash::notification')
<form method="post" action="{{url_locale('users/login')}}">
	{!! csrf_field() !!}
	@if (isset($redirectTo))
		<input type="hidden" name="redirectTo" value="{{$redirectTo}}">
	@endif
	<div class="form-group">
		<input type="phone" class="form-control" name="phone" value="" placeholder="{{trans('website.phone')}}" equired>
	</div>
	<div class="form-group">
		<input type="password" class="form-control" name="password" value="" autocomplete="off" placeholder="{{trans('website.password')}}" required>
	</div>


	<div class="form-group">
		<button type="submit" class="btn btn-primary btn-block" style="margin-right: 15px;">
			登录
		</button>
	</div>
	@if (!isset($with_register))
		<div class="form-group">
			<a class="btn btn-secondary btn-block" href="{{ url_locale('/register') }}">
				{{ trans('message.new_user') }}
			</a>
		</div>
	@endif
	<div class="form-group">
		<a class="btn btn-secondary btn-block" href="{{ url_locale('/password/reset') }}">
			{{ trans('message.password_forgot_your') }}
		</a>
	</div>
</form>
