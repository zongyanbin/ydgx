@if ($errors->any())
	<div class='text-center alert alert-info'>
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">{{icon('times')}}</button>
		{{icon('exclamation-circle', 'fa-3x')}}

		@foreach ( $errors->all() as $error)
			<p>{{ $error }}</p>
		@endforeach
	</div>
@endif

<form class="form-horizontal" role="form" method="POST" action="{{url_locale('/password/reset')}}">
	{{ csrf_field() }}
	<input type="hidden" name="token" value="{{ $token }}">
	<div class="form-group">
		<input type="email" class="form-control" name="email" value="{{ old('email') }}" autocomplete="off" placeholder="{{ trans('website.email') }}">
	</div>
	<div class="form-group">
		<input type="password" class="form-control" name="password" placeholder="{{trans('website.password')}}">
	</div>
	<div class="form-group">
		<input type="password" class="form-control" name="password_confirmation" placeholder="{{ trans('message.password_confirm') }}">
	</div>
	<div class="form-group">
		<button type="submit" class="btn btn-primary btn-block">{{ trans('message.password_reset') }}</button>
	</div>
</form>
