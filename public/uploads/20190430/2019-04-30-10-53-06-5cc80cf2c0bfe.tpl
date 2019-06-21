<{capture factory::load_css('/css/pb/skin_are.css')}><{/capture}>
<{capture factory::load_css('/css/ms/cuctv_upload/upload_20130417.css')}><{/capture}>
<{capture factory::load_js('/js/utlis/cuctv_min.js')}><{/capture}>
<{capture factory::load_js('/js/utlis/artDialog.min.js')}><{/capture}>
<{capture factory::load_js('/js/up/htmlFlash_20130417.js')}><{/capture}>
<{capture factory::load_js('/js/ui/showSchool_remote.js')}><{/capture}>
<{include file=factory::load_template('doc','common','2014')}>
<{include file=factory::load_template('header','common','2014')}>

<script type="text/javascript">
	var uid=<{$uid}>;
	var userName="<{$username}>";
	var isUgc = "<{$is_ugc}>";
	var default_categoryid="<{$default_categoryid}>";
	var category=<{json_encode($category_list)}>;
	var tags=<{json_encode($tag_list)}>;
	var default_tags="<{$default_tags}>";
	var special=<{json_encode($special_list)}>;
</script>
<div id="wrapOut">
    <div class="w960 tMarginLg upWrap">
        <div class="up_main rl">
            <div class="lm">
                <div class="lmod">
                    <div id="completeDiv"></div>
                    <div id="fsUploadProgress">
                    </div>
                    <!--点击按钮出现选择文件的弹出框-->
                    <div class="arrbg" id="uploadDiv">
                      <div class="upload-btn-wrap" id="uploadContent">
                           <{if $is_user_mobile||true}>
                                <div class="form_btn">
                                    <span class="form_btn_text">
                                        <object width="201" height="59" type="application/x-shockwave-flash" data="<{factory::load_config('app_domain', 'js_domain')}>/swf/NewVideoUpload_2013.swf?v=<{factory::load_config('system', 'swf_version')}>" id="fileUploader">
                                            <param name="movie" value="<{factory::load_config('app_domain', 'js_domain')}>/swf/NewVideoUpload_2013.swf?v=<{factory::load_config('system', 'swf_version')}>">
                                            <param name="allowFullScreen" value="true">
                                            <param name="wmode" value="transparent">
                                            <param name="wmode" value="Opaque">
                                            <param name="allowScriptAccess" value="always">
                                            <param name="FlashVars" value="UserID=<{$uid}>&UserName=<{$username}>&host=<{factory::load_config('app_domain', 'utcc_domain')}>&isCallBack=true">
                                        </object>
                                    </span>
                                </div>
                            <{else}>
                             <span><img src="http://img01.cuctv.com/M00/46/85/cR9WaVn6gsXDcszDAAAVNeKLKgI370.png"></span>
                            <{/if}>
                        </div>
                        <div class="importantInfo" id="uploadContentInfo">
                            <{if !$is_user_mobile}>
                            <h3>温馨提示：请 <a href="<{factory::load_config('app_domain','sso_domain')}>/modify/page_mobile" style="color:#cb0e02;"> 绑定手机号码  </a>后可上传视频！</h3>
                            <{/if}>
                            <ul class="tMarginLg">

                                <li>1、请勿上传色情、反动等违法视频和涉及版权的视频。</li>
                                <li>
                                    2、上传视频，即表示您默认同意
                                    <a href="<{factory::load_config('app_domain', 'www_domain')}>/Company/Statement.html" class="blueT" target="_blank">《视友法律说明》</a>。
                                </li>

                            </ul>
                        </div>
                        <!-- down area -->
                        <ul class="down-a">
                            <li class="g-line">
                                <em class="ico-sy fl"></em>
                                <dl class="g-lastu">
                                    <dt>视友友上传</dt>
                                    <dd>
                                        超大视频 · 上传稳定<br>
                                        <a href="http://www.cuctv.com/feature/download/syy.html" target="_blank">&gt;&gt;立刻下载</a>
                                    </dd>
                                </dl>
                            </li>
                            <li class="g-line">
                                <em class="ico-pai9 fl"></em>
                                <dl class="g-lastu">
                                    <dt>手机客户端</dt>
                                    <dd>
                                        即拍即传 · 随拍随分享<br>
                                        <a href="http://www.cuctv.com/feature/download/" target="_blank">&gt;&gt;下载手机客户端</a>
                                    </dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <{include file=factory::load_template('bottom','common','2014')}>
</div>
<div class="specialPop" id="specialPop">
    <form class="cmxform" id="special_Info" method="post" action="">
    <ul>
        <li class="ltit g-u"><span class="redT">*</span>标题：</li>
        <li class="g-u g-lastu l-fix"><input type="text" class="inp" id="txtSpecialTitle" name="txtSpecialTitle"></li>
        <li class="clear"></li>
        <li class="ltit g-u"><span class="redT">*</span>简介：</li>
        <li class="g-u g-lastu l-fix"><textarea name="txtSpecialDsc" id="txtSpecialDsc" class="area"></textarea></li>
        <li class="clear"></li>
        <li class="ltit g-u"><span class="redT">*</span>分类：</li>
        <li class="g-u sorBox_sort">
            <div class="oBox" id="sortBox_s">
                <span class="sortName_s">请选择视频所属分类</span>
                <span class="arrow"></span>
                <div class="sBox">
                    <p id="sSort"></p>
                </div>
            </div>
        </li>
        <li class="clear"></li>
        <li class="ltit g-u"><span class="redT">*</span>标签：</li>
        <li class="g-u"><input type="text" name="txtTag" id="txtTag" class="inp" value=""><span style="vertical-align:top"></span></li>
        <li class="clear"></li>
        <li class="ltit g-u">热门标签：</li>
        <li class="g-u" name="liTag" id="liTag">
        </li>
        <li class="clear"></li><li class="ltit g-u"></li>
        <li class="g-u g-lastu l-fix sorBox">
            <p class="tMarginLg">
                <a href="javascript:void(0)" class="btn_c"><input type="submit" value="保 存" /></a>
            </p>
        </li>
        </ul>
    </form>
</div>
<{include file=factory::load_template('footer','common','2014')}>
<script>
    $(function () {
        function getQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var reg_rewrite = new RegExp("(^|/)" + name + "/([^/]*)(/|$)", "i");
            var r = window.location.search.substr(1).match(reg);
            var q = window.location.pathname.substr(1).match(reg_rewrite);
            if(r != null){
                return unescape(r[2]);
            }else if(q != null){
                return unescape(q[2]);
            }else{
                return null;
            }
        }
        var menu_hides= getQueryString('menu_hide');

        if(menu_hides){
            $(".header-comm").hide();
            $(".footer").hide();
            $(".down-a").hide();
        }

    })

</script>
