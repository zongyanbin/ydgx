@extends('website.app')
@section('content')
<section id="map" class="map" ></section>
<main class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-4">
			<address>
				<h3>{!! config('maguttiCms.website.option.app.name')!!}</h3>
				<p>
					{!! config('maguttiCms.website.option.app.address')!!}<br>
					{!! config('maguttiCms.website.option.app.locality')!!}<br>
					{{icon('phone', 'fa-lg mr10')}}Tel {!! config('maguttiCms.website.option.app.phone')!!}<br>
					{{icon('fax', 'fa-lg mr10')}}Fax {!! config('maguttiCms.website.option.app.fax')!!}<br>
					{{icon('envelope', 'fa-lg mr10')}}<a href="mailto:{!! config('maguttiCms.website.option.app.email')!!}">{!! config('maguttiCms.website.option.app.email')!!}</a>
				</p>
			</address>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-8">
			@include('website.form.contact')
		</div>
	</div>
</main>
@endsection
@section('footerjs')
	@parent


@endsection
