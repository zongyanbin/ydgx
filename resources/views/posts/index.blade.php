<html>
<head>
    <script type="text/javascript" src="http://www.cms.com/static/js/jquery-2.1.4.min.js"></script>
</head>
<body>
    <!--begin comment-->
    <link rel="stylesheet" href="{{asset('static/css/info.css')}}">
    <!--end comment-->
    <!--评论 begin-->
    <div class="list_comment_content">
        <div class="commentAll">
            <!--评论区域 begin-->
            <div class="reviewArea clearfix">
                <textarea class="content comment-input" placeholder="Please enter a comment&hellip;" onkeyup="keyUP(this)"></textarea>
                <a href="javascript:;" class="plBtn">评论</a>
            </div>
            <!--评论区域 end-->
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
        </div>
        <script type="text/javascript" src="{{asset('static/js/jquery.flexText.js')}}"></script>
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
                    $.getJSON("json/pl.json",function(data){
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


<style>
    .mc-menu {
        padding-top:3.2em
    }
    .mc-menu ul {
        border-top:1px solid #eee;
        border-bottom:1px solid #eee;
        background-color:#FFF;
        margin-bottom:.8em
    }
    .mc-menu li {
        border-top:1px solid #eee;
        position:relative
    }
    .mc-menu li:first-child {
        border-top:0 none
    }
    .mc-menu a {
        display:block
    }
    .mc-menu .m-title {
        padding-left:1.6em;
        line-height:4.6;
        display:table-cell;
        vertical-align:middle
    }
    .mc-menu .m-title span, .mc-menu .m-title em {
        color:rgba(0, 0, 0, .85);
        font-size:1.4em;
        font-family:roboto, \65B9\6B63\5170\4EAD\51C6\9ED1_GBK
    }
    .mc-menu .m-arrows {
        position:absolute;
        right:.8em;
        top:50%;
        margin-top:-1.6em
    }

    @media only screen and (width:360px) {
        .icon-payment, .icon-receipt, .icon-coupon, .icon-msg {
            width: 32px;
            height: 32px;
            background-size: 32px 138px
        }

        .icon-receipt {
            background-position: 0 -35px
        }

        .icon-coupon {
            background-position: 0 -70px
        }

        .icon-msg {
            background-position: 0 -105px
        }

        .userinfo {
            height: 158px
        }

        .userinfo .h a {
            height: 158px;
            line-height: 158px
        }

        .userinfo .b {
            padding-top: 45px;
            padding-left: 25px
        }

        .userinfo .u-img {
            padding: 2px 4px 14px;
            width: 62px;
            height: 62px
        }

        .userinfo .u-accounts, .userinfo .u-vip, .userinfo .u-button {
            padding-left: 87px
        }

        .userinfo .u-vip {
            padding-top: 5px
        }

        .userinfo .u-button {
            padding-top: 8px
        }

        .userinfo .u-vip i {
            margin: 0 0 0 14px
        }

        .system-msg a {
            padding: 11px 0 6px
        }

        .system-msg .m-icon s {
            top: 1px;
            left: 21px;
            height: 14px;
            width: 14px;
            line-height: 16px
        }

        .mc-menu {
            padding-top: 8px
        }

        .mc-menu .m-title {
            padding-left: 16px;
            height: 63px
        }
    }
</style>

</body>
</html>
