@extends('website.app')
@section('content')
@include('website.partials.carousel')
<!--=== Content Part infoblock ===-->
<main class="container">
    <h1>{!! $article->title !!}</h1>１
    <h2>{!! $article->subtitle !!}</h2>２
    {!! $article->description !!}３
	<img src="{{get_image($article->image)}}" alt="">４
	<img src="{{get_image($article->doc)}}" alt="">
</main>
@endsection
