@extends('website.common.header_layouts')
@section('content')
    <!-- team -->
    <div id="home"></div>
    <div id="" class="team featured_services" style="margin-top: 10px;">
        <div class="container personal_gb_color">
      @include('website.common.message')
            <form class="form-horizontal" method="post" action="">
                {{ csrf_field() }}
            <div class="agile_wthree_inner_grids">
                <div class="update_personal">
                    <!--下面是用户名输入框-->
                    <h3 class="agile_tittle text-center personal_gb_color">请完善你的个人资料</h3><br>
                    <div class="row">
                        <div class="col-md-6 col-xs-6 text-center">
                            <div id="changeAvatar">
                                    <img style="width: 100px; height: 100px; float:right; margin-right: 5%; border-radius: 50%; border: 3px solid #eee; overflow: hidden;" src="{{$personal->face_picture ? $personal->face_picture:'http://img02.cuctv.com/M00/00/01/CgEBe1yUqvDMbx3uAAAoh8_RkSY151_100X100.png'}}" style="width: 100px;margin-top: 10px;margin: 0 auto;display:block;">
                                </div>
                        </div>
                        <div class="col-md-6 col-xs-6 " style="line-height: 8rem;">
                            <input id="image" type="file" accept="image/*" capture="camera"  value="上传头像" style=" margin-top:2.5rem;width:14rem; background-color: #7f7f7f; color: #ffffff;" class="btn btn-red"/>
                        </div>
                    </div>
                    <br>
                    <div class="col-sm-9 col-md-9  row" style="width: 100%;">
                        <input id="" type="text"  value="{{$personal->name}}"  name="personal[name]" class="form-control" placeholder="昵称" aria-describedby="basic-addon1">
                    </div>

                    <br>

                </div>
                <div class="row text-center col-sm-n col-md-n">
                    <button type="submit" style="width:14rem; background-color: darkred; color: #ffffff; margin-top: 2rem; margin-bottom: 2rem;" class="btn btn-red">保存 </button></div>
                <br>


            </div>
                <input type="hidden" id="basetxt" name="personal[face_picture]" value="{{$personal->face_picture}}">
            </form>

            <div class="clearfix"> </div>
        </div>
    </div>
    </div>

    @include('website.common.face')


    <div id="showEdit" style="display: none;width:100%;height: 100%;position: absolute;top:0;left: 0;z-index: 9;">
        <div style="width:100%;position: absolute;top:10px;left:0px;">
            <button class="mui-btn" data-mui-style="fab" id='cancleBtn' style="margin-left: 10px;">取消</button>
            <button class="mui-btn" data-mui-style="fab" data-mui-color="primary" id='confirmBtn' style="float:right;margin-right: 10px;">确定</button>
        </div>
        <div id="report">
            <img src="image/mei.jpg" style="width: 300px;height:300px">
        </div>
    </div>

@stop

