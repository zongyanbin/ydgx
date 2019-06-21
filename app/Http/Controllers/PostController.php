<?php

namespace App\Http\Controllers;

use App\Post;
use Illuminate\Http\Request;
class PostController extends Controller
{

    public function show(Request $request){
        \Auth::loginUsingId(1); //用户id为1的登录
        $post = $request;
        $post->load('comments.owner');
        $comments = $post->getComments();
        $comments['root'] = $comments;
        unset($comments['']);
        return view('posts.show', compact('post', 'comments'));
    }

    /**
     * 显示第一篇文章
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $post = Post::first();
        $collections = $post->getComments();
        $collections['root'] = $collections[$post['id']];
        unset($collections[$post['id']]);
        return view('posts.index', compact('post','collections'));
    }

}
