<!DOCTYPE html>
<html>
<head lang="{!! LaravelLocalization::getCurrentLocale() !!}">
	<title>{!! config('maguttiCms.admin.option.title') !!}</title>
	<!-- Latest compiled and minified CSS -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="csrf-token" content="{{ csrf_token() }}">


	<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Roboto:300,400"/>
	<link rel="stylesheet" href="{!! asset(config('maguttiCms.admin.path.plugins').'uploadifive/uploadifive.css')!!}">
	<link rel="stylesheet" href="http://use.fontawesome.com/releases/v5.8.1/css/solid.css" integrity="sha384-QokYePQSOwpBDuhlHOsX0ymF6R/vLk/UQVz3WHa6wygxI5oGTmDTv8wahFOSspdm" crossorigin="anonymous">
	<link rel="stylesheet" href="http://use.fontawesome.com/releases/v5.8.1/css/fontawesome.css" integrity="sha384-vd1e11sR28tEK9YANUtpIOdjGW14pS87bUBuOIoBILVWLFnS+MCX9T6MMf0VdPGq" crossorigin="anonymous">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
	<link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="{!! asset(config('maguttiCms.admin.path.plugins').'selectize/selectize.bootstrap3.css') !!}">
	<link rel="stylesheet" href="{!! asset(config('maguttiCms.admin.path.plugins').'custom-scrollbar/jquery.mCustomScrollbar.min.css')!!}" />
	<link rel="stylesheet" href="{!! asset(config('maguttiCms.admin.path.plugins').'colorpicker/css/bootstrap-colorpicker.min.css')!!}" />
	<link rel="stylesheet" href="{!! asset(config('maguttiCms.admin.path.common_css').'ma_helper.css')!!}">
	<link rel="stylesheet" href="{!! asset(config('maguttiCms.admin.path.cms_css').'bootstrap-theme.css')!!}">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.1/cropper.min.css">
	<script src="https://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
	<link rel="stylesheet" href="{{ mix('cms/css/admin.css') }}">
	<link rel="icon" href="{!! asset('/favicon.jpg') !!}" type="any" sizes="20x20">
	<script>
		// init  some   global  variable
		var    _SERVER_PATH  = "{!! url('') !!}";
		var    _LOCALE 		 = "{!! LaravelLocalization::getCurrentLocale() !!}";
		var    _CURMODEL 	 = "{!! ( isset($pageConfig['model']) ? $pageConfig['model'] : "" ) !!}";
		window.Laravel       = <?php echo json_encode(['csrfToken' => csrf_token()]); ?>
	</script>
</head>
<body class="{{(!Auth::guard('admin')->check())? 'login': ''}}">
<div  class="cont_nr"></div>
	@if (Auth::guard('admin')->check())
		@include('admin.common.navbar')
	@endif
	@yield('content')
	<!-- Latest compiled and minified JavaScript -->
	<!--<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>-->
	<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="{{ mix('/cms/js/appcms.js') }}"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script src="{!! asset(config('maguttiCms.admin.path.plugins').'custom-scrollbar/jquery.mCustomScrollbar.concat.min.js')!!}"></script>
	<script src="{!! asset(config('maguttiCms.admin.path.plugins').'notify.min.js')!!}"></script>
	<script src="{!! asset(config('maguttiCms.admin.path.plugins').'tinymce/tinymce.min.js')!!}"></script>
	<script src="{!! asset(config('maguttiCms.admin.path.plugins').'colorpicker/js/bootstrap-colorpicker.min.js')!!}"></script>
	<script src="{!! asset(config('maguttiCms.admin.path.plugins').'bootbox.js') !!}"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.1/cropper.min.js" charset="utf-8"></script>
	<script src="{{ mix('/cms/js/cms.js') }}"></script>
	<script src="{{ mix('/cms/js/header.js') }}"></script>
	<script>

	$(document).ready(function() {
		Cms.init();
	});
</script>

@yield('footerjs')
</body>
</html>
