@extends('website.app_user')
@section('content')
	<main class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-sm-push-3 col-md-4 col-md-push-4">
				<h1 class="text-center">{{ trans('message.password_forgot') }}</h1>
				@include('website.auth.form.password')
			</div>
		</div>
	</main>
@endsection
