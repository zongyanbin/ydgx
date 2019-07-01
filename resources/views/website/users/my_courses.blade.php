@extends('website.common.header_layouts')
@section('content')
    <link href="{{asset('static/slide/css/mc-components.css')}}" rel="stylesheet" type="text/css" media="all" />
    <div id="team" class="team featured_services" style="margin-top: 10px;">
        <div class="container">
            <div class="wthree_head_section">
                <h3 class="agile_tittle"><i class="fa" aria-hidden="true"></i> <span>Video</span>我的课程</h3>
            </div>

            <div class="col-sm-6" data-segment-action="aaron-franklin-teaches-texas-style-bbq" data-segment-instructor-tile-trigger="true">
                <a id="aaron-franklin-teaches-texas-style-bbq" href="{{asset('/users/bought')}}">
                    <div class="mc-tile mc-tile--16x9">
                        <div class="mc-tile__content">
                            <div class="mc-tile__component mc-tile-image"><div class="mc-tile-image__image mc-background mc-background--loaded mc-background--position-x-center mc-background--position-y-center mc-background--fit-container mc-background--size-cover mc-background--size-cover-width"><div class="mc-background__background-container">
                                        <img class="mc-background__background error" data-src="{{asset('static/img/005.jpg')}}" src="{{asset('static/img/005.jpg')}}" data-was-processed="true"></div></div></div>
                            <div class="mc-tile__component mc-tile-overlay mc-tile-overlay--gradient-bottom"></div><div class="mc-tile__component mc-tile-caption mc-tile-caption--x-left mc-tile-caption--y-bottom"><div class="mc-tile-caption__content mc-p-3">
                                    <h5 class="mc-text-h5 mc-text--uppercase">标题</h5>
                                    <h6 class="mc-text-h6 mc-text--airy mc-text--muted">内容</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>



            <div class="clearfix"> </div>
            </div>
        </div>
    </div>
@stop
