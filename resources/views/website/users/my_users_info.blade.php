@extends('website.common.layouts')
    @section('content')
        <script type="text/javascript" src="{{asset('static/js/jquery-2.1.4.min.js')}}"></script>
        <!-- //custom-theme -->
        <link href="{{asset('static/css/bootstrap.css')}}" rel="stylesheet" type="text/css" media="all" />
        <!--begin comment-->
        <link rel="stylesheet" href="{{asset('static/css/info.css')}}">
        <!--end comment-->
        <!-- team -->
        <div id="home"></div>
        <div id="team" class="team featured_services" >
            <div class="container">
                <div class="agile_wthree_inner_grids">
                    <div class="user_info"><!--begin userinfo-->
                        <div class="row">
                            <div class="col-xs-4 col-md-4"></div>
                            <div class="col-xs-4 col-md-4 user_info_face textcenter" style="margin-bottom: 1.5rem; font-size: 2.5rem;">
                                <p><img class="center-block" style="width: 100px; height: 100px; border-radius: 50%; border: 3px solid #eee; overflow: hidden;"  src="{{$personal->face_picture ? $personal->face_picture:'http://img02.cuctv.com/M00/01/01/rBFTjV0WrNKkztP_AACAQROhbmE804.png'}}"></p><br>
                                <b>{{$personal->name ? $personal->name :'未设置'}}</b>
                            </div>

                            <div class="col-xs-4 col-md-4 " style="color: #8B8B8B;"> <i class="iconfont icon-qianbi"></i>&nbsp;&nbsp;<a href="{{url('users/personal')}}">编辑个人资料</a></div>
                        </div>

                        <div class="row">
                            <div class="col-xs-3 col-md-3"></div>
                            <div class="col-xs-3 col-md-3 user_info_face textcenter">
                                <p><img class="center-block" src="http://img02.cuctv.com/M00/00/00/rBFTjV0WrYWFRpC-AAAPqv5Jib0926.gif" style="width: 28%"></p><br>
                                <b>2课节数</b>
                            </div>
                            <div class="col-xs-3 col-md-3 user_info_face textcenter line-color-f">
                                <p><img class="center-block" src="http://img02.cuctv.com/M00/00/01/rBFTjV0WrzKwwJUaAAAfXbYojsE797.png" style="width: 20%"></p><br>
                                <b>5评论数</b>
                            </div>
                            <div class="col-xs-3 col-md-3"></div>
                        </div>
                    </div><!--end userinfo-->

                    <div class="info_comments">
                        <h3 class="info_title">我的课程及评论</h3>
                        <div class="info_comments_content">
                            <div class="row">
                                <img class="info_comments_content_img" src="http://www.topclassx.com/static/img/005.jpg">
                            </div>
                            <div class="row">
                                <!--评论 begin-->
                                <div class="list_comment_content color_heise">
                                    <div class="commentAll color_heise">
                                        <!--回复区域 begin-->
                                        <div class="comment-show">
                                            <div class="comment-show-con clearfix">
                                                <div class="comment-show-con-img pull-left"><img src="images/header-img-comment_03.png" alt=""></div>
                                                <div class="comment-show-con-list pull-left clearfix">
                                                    <div class="pl-text clearfix">
                                                        <a href="#" class="comment-size-name">张三 : </a>
                                                        <span class="my-pl-con">&nbsp;来啊 造作啊!</span>
                                                    </div>
                                                    <div class="date-dz">
                                                        <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                                        <div class="date-dz-right pull-right comment-pl-block">
                                                            <a href="javascript:;" class="removeBlock">删除</a>
                                                            <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                            <span class="pull-left date-dz-line">|</span>
                                                            <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a>
                                                        </div>
                                                    </div>
                                                    <div class="hf-list-con"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--回复区域 end-->
                                        <!--评论区域 begin-->
                                        <div class="reviewArea clearfix">
                                            <textarea class="content comment-input" placeholder="Please enter a comment&hellip;" onkeyup="keyUP(this)"></textarea>
                                            <a href="javascript:;" class="plBtn">评论</a>
                                        </div>
                                        <!--评论区域 end-->
                                    </div>

                                    <!--textarea高度自适应-->
                                    <script type="text/javascript">
                                        $(function () {
                                            $('.content').flexText();
                                        });
                                    </script>
                                    <!--textarea限制字数-->
                                    <script type="text/javascript">
                                        function keyUP(t){
                                            var len = $(t).val().length;
                                            if(len > 139){
                                                $(t).val($(t).val().substring(0,140));
                                            }
                                        }
                                    </script>
                                    <!--点击评论创建评论条-->
                                    <script type="text/javascript">
                                        $('.commentAll').on('click','.plBtn',function(){
                                            var myDate = new Date();
                                            //获取当前年
                                            var year=myDate.getFullYear();
                                            //获取当前月
                                            var month=myDate.getMonth()+1;
                                            //获取当前日
                                            var date=myDate.getDate();
                                            var h=myDate.getHours();       //获取当前小时数(0-23)
                                            var m=myDate.getMinutes();     //获取当前分钟数(0-59)
                                            if(m<10) m = '0' + m;
                                            var s=myDate.getSeconds();
                                            if(s<10) s = '0' + s;
                                            var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
                                            //获取输入内容
                                            var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
                                            console.log(oSize);
                                            //动态创建评论模块
                                            oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img src="images/header-img-comment_03.png" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">David Beckham : </a> <span class="my-pl-con">&nbsp;'+ oSize +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
                                            if(oSize.replace(/(^\s*)|(\s*$)/g, "") != ''){
                                                $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
                                                $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value','').siblings('pre').find('span').text('');
                                            }
                                        });
                                    </script>
                                    <!--点击回复动态创建回复块-->
                                    <script type="text/javascript">
                                        $('.comment-show').on('click','.pl-hf',function(){
                                            //获取回复人的名字
                                            var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
                                            //回复@
                                            var fhN = '回复@'+fhName;
                                            //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
                                            var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl">评论</a></div>';
                                            //显示回复
                                            if($(this).is('.hf-con-block')){
                                                $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
                                                $(this).removeClass('hf-con-block');
                                                $('.content').flexText();
                                                $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
                                                //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
                                                //input框自动聚焦
                                                $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
                                            }else {
                                                $(this).addClass('hf-con-block');
                                                $(this).parents('.date-dz-right').siblings('.hf-con').remove();
                                            }
                                        });
                                    </script>
                                    <!--评论回复块创建-->
                                    <script type="text/javascript">
                                        $('.comment-show').on('click','.hf-pl',function(){
                                            var oThis = $(this);
                                            var myDate = new Date();
                                            //获取当前年
                                            var year=myDate.getFullYear();
                                            //获取当前月
                                            var month=myDate.getMonth()+1;
                                            //获取当前日
                                            var date=myDate.getDate();
                                            var h=myDate.getHours();       //获取当前小时数(0-23)
                                            var m=myDate.getMinutes();     //获取当前分钟数(0-59)
                                            if(m<10) m = '0' + m;
                                            var s=myDate.getSeconds();
                                            if(s<10) s = '0' + s;
                                            var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
                                            //获取输入内容
                                            var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();
                                            console.log(oHfVal)
                                            var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
                                            var oAllVal = '回复@'+oHfName;
                                            if(oHfVal.replace(/^ +| +$/g,'') == '' || oHfVal == oAllVal){

                                            }else {
                                                $.getJSON("/pl.json",function(data){
                                                    var oAt = '';
                                                    var oHf = '';
                                                    $.each(data,function(n,v){
                                                        delete v.hfContent;
                                                        delete v.atName;
                                                        var arr;
                                                        var ohfNameArr;
                                                        if(oHfVal.indexOf("@") == -1){
                                                            data['atName'] = '';
                                                            data['hfContent'] = oHfVal;
                                                        }else {
                                                            arr = oHfVal.split(':');
                                                            ohfNameArr = arr[0].split('@');
                                                            data['hfContent'] = arr[1];
                                                            data['atName'] = ohfNameArr[1];
                                                        }

                                                        if(data.atName == ''){
                                                            oAt = data.hfContent;
                                                        }else {
                                                            oAt = '回复<a href="#" class="atName">@'+data.atName+'</a> : '+data.hfContent;
                                                        }
                                                        oHf = data.hfName;
                                                    });

                                                    var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">我的名字 : </a><span class="my-pl-con">'+oAt+'</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div></div>';
                                                    oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display','block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();
                                                });
                                            }
                                        });
                                    </script>
                                    <!--删除评论块-->
                                    <script type="text/javascript">
                                        $('.commentAll').on('click','.removeBlock',function(){
                                            var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
                                            if(oT.siblings('.all-pl-con').length >= 1){
                                                oT.remove();
                                            }else {
                                                $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
                                                oT.remove();
                                            }
                                            $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();

                                        })
                                    </script>
                                    <!--点赞-->
                                    <script type="text/javascript">
                                        $('.comment-show').on('click','.date-dz-z',function(){
                                            var zNum = $(this).find('.z-num').html();
                                            if($(this).is('.date-dz-z-click')){
                                                zNum--;
                                                $(this).removeClass('date-dz-z-click red');
                                                $(this).find('.z-num').html(zNum);
                                                $(this).find('.date-dz-z-click-red').removeClass('red');
                                            }else {
                                                zNum++;
                                                $(this).addClass('date-dz-z-click');
                                                $(this).find('.z-num').html(zNum);
                                                $(this).find('.date-dz-z-click-red').addClass('red');
                                            }
                                        })
                                    </script>
                                </div><!--评论 end -->

                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
@section('js')
    <script type="text/javascript" src="{{asset('static/js/jquery.flexText.js')}}"></script>

@stop
    @stop
