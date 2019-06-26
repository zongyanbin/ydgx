<form method="POST" action="{{url('post/'.$post->id.'/comments')}}" accept-charset="UTF-8">
    {{csrf_field()}}

    @if(isset($parentId))
        <input type="hidden" name="parent_id" value="{{$parentId}}">
    @endif
    <div class="form-group">
        <label for="body" class="control-label">内容:</label>
        <textarea id="body" name="body"  class="form-control" required="required"></textarea>
    </div>
        <button type="submit" class="btn btn-success"><a href='@if(!isset($c_uid)){{url('/users/login')}}  target="_blank" @endif'>回复</a></button>
</form>