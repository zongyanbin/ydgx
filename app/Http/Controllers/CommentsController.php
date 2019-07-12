<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Comments;
use Illuminate\Http\Request;
use App\Post;

class CommentsController extends Controller
{
  public function store(Post $post)
  {

      $uid = \Illuminate\Support\Facades\Auth::id();
      if(!$uid){
          return redirect('/en/users/login' )
              ->withErrors(['此授权码已过期，请重新生成！']);
      }
      if (request('parent_id')) {
          $real_comment = Comments::findOrFail(request('parent_id'));
          $level = $real_comment->level + 1;
          if ($level >= 3) {
              $level = 3;
          }
      }

      $comment = $post->comments()->create([
          'body' => request('body'),
          'user_id' =>\Illuminate\Support\Facades\Auth::id(),
          'level' => isset($level) ? $level: 0,
          'parent_id' => request('parent_id', null),
      ]);
      $comment = Comments::with('owner')->find($comment->id);
      return response()->json([
          'success' => true,
          'reply_block' => $comment,
      ]);
  }
}
