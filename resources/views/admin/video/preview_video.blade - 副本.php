<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style type="text/css">
        body {
            background-color: #000;
            margin-left: 0px;
            margin-top: 0px;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>视频播放器</title>
    <meta name="referrer" content="never">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>*{margin:0;padding:0}</style>
    <link href="https://unpkg.com/video.js/dist/video-js.css" rel="stylesheet">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://unpkg.com/video.js/dist/video.js"></script>
</head>
<body>
<script>
           var first_video = '{{ $arr_view['first']  }}';
           var list_video = '{{ $arr_view['list']  }}';
           var vList = [''+first_video+'',''+list_video+'']; // 初始化播放列表
    var isWap = navigator.userAgent.match(/iPad|iPhone|iPod|Android/i) != null;
    var vid= ("http://sh.yinyuetai.com/uploads/videos/common/C97D01531E211FFF8756FC6010259EAB.mp4");
    if(isWap){
        document.writeln('<video src="'+vid+'" controls="controls" preload="preload" poster="https://wx1.sinaimg.cn/mw690/005yF2tCgy1fn67stcy3wg30jq0dwq2z.gif" width="100%" height="100%" autoplay="autoplay"></video>');
    }else {
        document.writeln('<video id="my_video_1" class="video-js vjs-big-play-centered vjs-fill"  controls preload="auto" data-setup=\'{}\' autoplay>\n' +
                '    <source src="'+first_video+'" type="video/mp4"></source>\n' +
                '</video>');
    }
</script>

</body>
</html>
<script type="text/javascript">


    window.onload=function(){
        var videoPanelMenu = $(".vjs-fullscreen-control");
        videoPanelMenu.before('<div class="vjs-subs-caps-button  vjs-menu-button vjs-menu-button-popup vjs-control vjs-button"  aria-live="polite" aria-expanded="false" aria-haspopup="true">'
                + '<div class="vjs-menu" role="presentation">'
                + '<ul class="vjs-menu-content" role="menu">'
                + '<li class="vjs-menu-item" tabindex="-1" role="menuitemcheckbox"  onclick="changeVideo(1)">普通</li>'
                + '<li class="vjs-menu-item" tabindex="-1" role="menuitemcheckbox"  onclick="changeVideo(2)">标清 </li>'
                + '<li class="vjs-menu-item" tabindex="-1" role="menuitemcheckbox"  onclick="changeVideo(3)">高清 </li>'
                + '</ul></div>'
                +'  <button class="vjs-subs-caps-button vjs-control vjs-button" type="button" aria-live="polite" title="清晰度切换" aria-disabled="false">'
                +'      <span aria-hidden="true" class="vjs-icon-placeholder"></span><span class="vjs-control-text">清晰度切换</span>'
                +'  </button>'
                +'</div>'
        );

        var obj={tag:false,ctime:0};
        window.obj=obj;
        var myPlayer=videojs.getPlayers()['my_video_1'];
        myPlayer.on("timeupdate", function(){
            if(window.obj.tag){
                videojs("my_video_1").currentTime(window.obj.ctime)
                videojs("my_video_1").play();
                window.obj.tag=false;
            }
            //视频打点
            var ctime_=videojs("my_video_1").currentTime().currentTime();
            if(ctime_==60){
                videojs("my_video_1").currentTime(ctime_+1);
                //do something
            }
        });
    }
    changeVideo(1);
    function changeVideo(type){
        var ctime=videojs("my_video_1").currentTime();
        if(type==1){
            var vLen = vList.length; // 播放列表的长度
            var curr = 0; // 当前播放的视频

            var video = videojs("my_video_1", {
                    loop : false,
            }, function () {
                this.on('ended', function () {

                }),
                this.on('ended', function () {
                    play();
                    function play(e) {
                        if (curr== vLen-1) {
                            video.pause();
                            curr=0;
                            return;
                        }
                        curr++;
                        video.src(vList[curr]);
                        video.load();
                        video.play();

                    }
                })
            })

        }
        if(type==2){
            videojs("my_video_1").src([{type: "video/mp4", src: ("http://static.cuctv.com/20160119163000/swf/v/video_player_2015.swf?vid=8HyOABl0xD8") }]);
            videojs("my_video_1").play();
        }
        if(type==3){
            videojs("my_video_1").src([{type: "video/mp4", src: ("http://static.cuctv.com/20160119163000/swf/v/video_player_2015.swf?vid=8HyOABl0xD8") }]);
            videojs("my_video_1").play();
        }
        window.obj.ctime=ctime;
        window.obj.tag=true;
    }
</script>