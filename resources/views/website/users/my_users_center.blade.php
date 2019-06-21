@extends('website.common.header_layouts')
@section('content')
    <section class="mc-menu">
        <ul>
<div style="text-align: center; font-size: 3rem; font-weight: bold; margin: 2rem;">用户中心</div>
            <li>
                <a id="bookingHref" href="{{url('users/personal')}}">
                    <p class="m-title"><span>用户信息</span></p>
                    <s class="m-arrows"><i class="icon-arrows-right"></i></s>
                </a>
            </li>
            <li>
                <a id="orderHref" href="{{url('users/my_courses')}}">
                    <p class="m-title"><span>我的课程</span></p>
                    <s class="m-arrows"><i class="icon-arrows-right"></i></s>
                </a>
            </li>
            <li>
                <a id="orderHref" href="{{url('users/bought')}}">
                    <p class="m-title"><span>已购买的课程</span></p>
                    <s class="m-arrows"><i class="icon-arrows-right"></i></s>
                </a>
            </li>

            <li>
                <a id="couponHref" href="{{url('users/reset')}}">
                    <p class="m-title"><span>重置密码</span></p>
                    <s class="m-arrows"><i class="icon-arrows-right"></i></s>
                </a>
            </li>


        </ul>
        <ul>
            <li>
                <a href="#">
                    <p class="m-title"><span>联系客服</span></p>
                    <s class="m-arrows"><i class="icon-arrows-right"></i></s>
                </a>
            </li>
            <li>
                <a href="{{url_locale('users/logout')}}">
                    <p class="m-title"><span>安全退出</span></p>
                    <s class="m-arrows"><i class="icon-arrows-right"></i></s>
                </a>
            </li>
        </ul></section>
@stop
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