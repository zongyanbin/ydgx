@extends('website.app_user')
@section('content')
	<main class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-sm-push-3 col-md-4 col-md-push-4">
				<h1 class="text-center">{{ trans('message.register_account') }}</h1>
                @include('website.auth.form.register')
			</div>
		</div>
	</main>
	<script type="text/javascript">
		$(function () {
			$('#action-btn').click(function () {

				var id_code_val = $("#id_code_val").val();
				console.log(aa);
				return false;
			});
		});
	</script>
@endsection
