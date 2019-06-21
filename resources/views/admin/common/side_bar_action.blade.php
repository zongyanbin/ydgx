<h3>{!! trans('admin.label.actions')!!}</h3>
<hr>
<ul>
	@if ($pageConfig['copy']==1 && $article->id!='')
		<li>
			<a href="{{ma_get_admin_copy_url($article)}}">{{icon('copy')}}{!! trans('admin.label.copy')!!}</a>
		</li>
	@endif
	@if ($pageConfig['create']==1)
		<li>
			<a href="{{ma_get_admin_create_url($article)}}">{{icon('plus')}}{!! trans('admin.message.add_new_item')!!}</a>
		</li>
	@endif
	<li>
		<a href="{{ma_get_admin_list_url($article)}}">{{icon('reply')}}{!! trans('admin.message.back_to_list')!!}</a>
	</li>
	@if ($pageConfig['preview']==1)
		<li>
			<a href="{{ma_get_admin_preview_url($article)}}" target="_new">{{icon('eye')}}{!! trans('admin.message.view_page')!!}</a>
		</li>
	@endif
</ul>
