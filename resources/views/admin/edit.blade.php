@extends('admin.master')
@section('title', 'Edit')
@section('content')
	@include('admin.common.action-bar')
	<main id="edit-main" class="container-fluid">
		@include('flash::notification')

		<div class="row">
			<div class="col-xs-12 col-sm-8">
				{{ Form::model($article, ['files' => true, 'id'=>'edit-form', 'accept-charset' => "UTF-8"]) }}
				<div class="card">
					@if ($pageConfig->get('help'))
						{{$pageConfig->get('help')}}
						<hr>
					@endif
					<ul class="nav-tabs">
						<li class="active">
							<a href="#content_tab" data-toggle="tab">
								{{icon('file-alt')}} {{trans('admin.label.content')}}
							</a>
						</li>
						@if ($pageConfig->get('showSeo') == 1)
							<li>
								<a href="#seo_tab" data-toggle="tab">
									{{icon('globe-africa')}} {{trans('admin.label.seo')}}
								</a>
							</li>
						@endif
						@if ($pageConfig->get('showMedia') == 1 && $article->id!='')
							<li>
								<a href="#media_tab" data-toggle="tab">
									{{icon('image')}} {{trans('admin.label.media')}}
								</a>
							</li>
						@endif
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="content_tab">
							{{ AdminForm::get( $article ) }}
							@if ($pageConfig->get('password') == 1)
								@include('admin.helper.password')
							@endif

						</div>
						@if ($pageConfig->get('showSeo') == 1)
							<div role="tabpanel" class="tab-pane" id="seo_tab">
								{{ AdminForm::getSeo( $article ) }}
							</div>
						@endif
						@if ($pageConfig->get('showMedia') == 1 && $article->id!='')
							<div role="tabpanel" class="tab-pane" id="media_tab">
								@if ($pageConfig->get('showMediaCropper'))
									@include('admin.helper.form_mediacropper', ['cropperConfig' => collect($pageConfig->get('mediaCropper'))])
								@else
									@include('admin.helper.form_uploadifive')
								@endif
								@include('admin.helper.media_images')
								@include('admin.helper.media_docs')
							</div>
						@endif
					</div>
				</div>
				@include('admin.common.form_submit_button')
				{{ Form::close() }}
			</div>
			<div class="col-xs-12 col-sm-4">
				<div id="edit-sidebar" class="card">
					@includeFirst(['admin.'.strtolower($pageConfig->get('model')).'.side_bar_action', 'admin.common.side_bar_action'])
				</div>
			</div>
		</div>
	</main>
	<div id="info" class="hidden"></div>

	<!-- Modal -->
	<div class="modal fade" id="modal-media" tabindex="-1" role="dialog" aria-labelledby="modal-mediaLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			</div><!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	@include('admin.helper.filemanager')

@endsection
@section('footerjs')
	<script src="{!! asset(config('maguttiCms.admin.path.plugins').'uploadifive/jquery.uploadifive.min.js')!!}" type="text/javascript"></script>
	<script src="{!! asset(config('maguttiCms.admin.path.plugins').'timepicker/jquery-ui-timepicker-addon.js')!!}" type="text/javascript"></script>
	<script src="{!! asset(config('maguttiCms.admin.path.plugins').'selectize/selectize.min.js')!!}" type="text/javascript"></script>
	<script src="{{ mix(config('maguttiCms.admin.path.cms_js'). 'lara-file-manager.js') }}"></script>
	<script type="text/javascript">
	$(function() {
		Cms.initTinymce();
		Cms.initColorPicker();
		Cms.initFiles();
		Cms.initDatePicker();
		Cms.initDateTimePicker();
		Cms.initUploadifiveSingle();
		Cms.initUploadifiveMedia();
		Cms.initSortableList("ul#simpleGallery");
		Cms.initSortableList("ul#simpleDocGallery");
		Cms.initImageRelationList();
		Cms.initMediaModal();
		$('.selectizemulti').selectize({
			plugins: ['remove_button', 'drag_drop'],
			delimiter: ',',
			persist: false,
			create: false,
			sortField: 'text',
			allowEmptyOption: true,
		});
		$('.selectize').selectize({
			sortField: 'text',
			allowEmptyOption: true,
		});
	});
</script>
<script>
$('#flash-overlay-modal').modal();
</script>
@endsection
