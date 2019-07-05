<!--video begin -->
<link href="https://cdn.bootcss.com/video.js/7.3.0/video-js.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/video.js/7.3.0/video.min.js"></script>
<script>window.HELP_IMPROVE_VIDEOJS = false;</script>


<div class=""> <!--vjs-fluid-->
    <video id="my-player" class="video-js vjs-16-9  vjs-big-play-centered" controls preload="auto" poster="http://vjs.zencdn.net/v/oceans.png">
        <source src="http://vjs.zencdn.net/v/oceans.mp4" type="video/mp4"></source>
        <source src="http://vjs.zencdn.net/v/oceans.webm" type="video/webm"></source>
        <source src="http://vjs.zencdn.net/v/oceans.ogv" type="video/ogg"></source>
        <p class="vjs-no-js">
            To view this video please enable JavaScript, and consider upgrading to a
            web browser that
            <a href="http://videojs.com/html5-video-support/" target="_blank">
                supports HTML5 video
            </a>
        </p>
    </video>
</div>
<script>
    var player = videojs('my-player');
    var options = {};
    var player = videojs('my-player', options, function onPlayerReady() {
        videojs.log('Your player is ready!');
        // In this context, `this` is the player that was created by Video.js.
        this.play();
        // How about an event listener?
        this.on('ended', function() {
            videojs.log('Awww...over so soon?!');
        });
    });
</script>