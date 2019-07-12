
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>支付</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link href="{{asset('static/css/pay.css')}}" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="{{asset('static/js/bootstrap-3.1.1.min.js')}}"></script>
    <script src="{{asset('static/js/jquery-2.1.4.min.js')}}"></script>
</head>
<body>

<section class="aui-flexView">
    <header class="aui-navBar aui-navBar-fixed">
        <a href="javascript:;" class="aui-navBar-item">
            <i class="icon icon-return"></i>
        </a>
        <div class="aui-center">
            <span class="aui-center-title">支付订单</span>
        </div>
        <a href="javascript:;" class="aui-navBar-item">
            <i class="icon icon-sys"></i>
        </a>
    </header>
    <section class="aui-scrollView">
        <div class="aui-flex-member-list">
            <ul class="aui-cho-box">
                <!--
                                    <li class="aui-flex on">
                                        <div class="aui-flex-box">
                                            <h3>
                                                课程名称:
                                                <em>
                                                   马克思课程
                                                </em>
                                                <br>
                                                课程价格:
                                                 <em>
                                                   马克思课程:6元
                                                </em>
                                            </h3>

                                        </div>


                                    </li>

                -->

                <li class="aui-flex">
                    <div class="aui-flex-box">
                        <h3>课程名称：马克思视频教学</h3>


                    </div>
                    <div class="aui-original-thj">
                        课程特惠价 <i>￥</i>
                    </div>
                    <i class="aui-price">6</i>
                    <div class="aui-original-pic">
                        ￥90
                    </div>
                </li>

            </ul>
            <div style="display:none">
                <input name="" type="text" value="1" class="auiSks" />
            </div>
            <p class="aui-total b-line">
                需要支付： <span>6</span>
                元


            </p>
            <div class="chi">
                <div class="aui-flex b-line" style="padding:15px 0">
                    <div class="aui-flex-wx">
                        <img src="{{asset('static/images/icon-wx.png')}}" alt="">
                    </div>
                    <div class="aui-flex-box aui-flex-box-clear">
                        <h4>
                            微信支付


                            <em class="aui-flex-box-tj">
                                <img src="{{asset('static/images/icon-tj.png')}}" alt="">
                            </em>
                        </h4>
                        <p>亿万用户的选择，更快更安全</p>
                    </div>
                    <div class="aui-payment-method">
                        <label class="cell-right">
                            <input type="radio" name="radio" value="wx" checked="checked">
                            <i class="cell-radio-icon"></i>
                        </label>
                    </div>
                </div>
                <div class="aui-flex b-line" style="padding:15px 0">
                    <div class="aui-flex-wx">
                        <img src="{{asset('static/images/icon-zfb.png')}}" alt="">
                    </div>
                    <div class="aui-flex-box">
                        <h4>支付宝支付</h4>
                        <p>亿万用户的选择</p>
                    </div>
                    <div class="aui-payment-method">
                        <label class="cell-right">
                            <input type="radio" name="radio" value="zfb">
                            <i class="cell-radio-icon"></i>
                        </label>
                    </div>
                </div>

                <div class="aui-flex b-line" style="padding:15px 0">
                    <div class="aui-flex-wx">
                        <img src="{{asset('static/images/icon-ck.png')}}" alt="">
                    </div>
                    <div class="aui-flex-box">
                        <h4>通过CD-key兑换课程</h4>
                        <!--                            <p>亿万用户的选择</p>-->
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-envelope"></i></span>
                            <input class="span2" id="inputIcon" type="text">
                        </div>
                    </div>
                    <div class="aui-payment-method">
                        <label class="cell-right">
                            <input type="radio" name="radio" value="zfb">
                            <i class="cell-radio-icon"></i>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer class="aui-tabBar aui-tabBar-fixed">
        <button class="aui-tabBar-btn">提交</button>
    </footer>
</section>
<script type="text/javascript">
    $(document).ready(function(e) {
        $(".aui-cho-box li").click(function() {

            $(this).addClass("on").siblings().removeClass("on");
            tola();
        });

    });

    function tola() {
        var $li = $(".aui-cho-box").children("li.on");
        var money = $li.children("i").text();
        var count = $(".auiSks").val();
        $(".aui-total span").text(money * count);
    }
    $(".aui-tabBar-btn").click(function(){
        alert('恭喜您，购买成功！');
        window.location.href="{{url('users/my_courses')}}";
    });
</script>
</body>
</html>

