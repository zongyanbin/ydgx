@foreach($collections as $comment)
    @include('comments.comments',['comment'=>$comment])
@endforeach