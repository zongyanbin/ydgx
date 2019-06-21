@extends('admin.master')
@section('content')
    <!-- 成功提示框 -->
    @if (Session::has('success'))
        <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>成功!</strong> {{ Session::get('success') }}
        </div>
    @endif

    <!-- 失败提示框 -->
    @if (Session::has('error'))
        <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>失败!</strong> {{ Session::get('error') }}
        </div>
    @endif
    {{--@include('admin.common.message')--}}
    <!-- 自定义内容区域 -->
    <div class="panel panel-default">
        <div class="panel-heading">列表</div>
        <table class="table table-striped table-hover table-responsive">
            <thead>
            <tr>
                <th width="5%">视频ID</th>
                <th width="5%">视频标题</th>
                <th width="10%" >视频时长</th>
                <th width="15%" style="text-align: center;">视频状态</th>
                <th width="10%">视频缩略图</th>
                <th width="15%">文件/</th>
                <th width="10%">创建时间</th>
                <th >操作</th>
            </tr>
            </thead>

            <tbody>
            @foreach($videos as $video)
            <tr>
                <th scope="row">{{$video->vid}}</th>
                <td>{{$video->title}}</td>
                <td>{{ $video->duration}}</td>
                <td align='center'>
                    @if($video->video_status>=20)
                        <font color="green">审核通过</font>
                    @else
                        <font color="red">正在审核/未审核通过</font>
                    @endif
                </td>
                <td><img style="width:80px;height:30px;display:block" src="{{$video->thumb}}" onclick="showMaxImg(this)"> </td>
                @if($video->fileurl)
                <td><a href="{{$urlpu}}/{{$video->fileurl}}">{{$video->fileurl}}</a></td>
                @else
                    <td>{{$video->fileurl}}</td>
                @endif
                <td>{{ date('Y-m-d' ,$video->createtime) }}</td>
                <td style="width:10%">
                    @if($video->video_status>=20)
                        <a href="javascript:void(0)" onclick="showdata('{{$video->vid}}')">预览视频</a>
                    @endif
                    @if($video->fileurl)
                        <a href="{{url('admin/file?id='.$video->id)}}" style="color: darkred;">编辑文件</a>
                    @else
                            <a href="{{url('admin/file?id='.$video->id)}}" style="color: darkred;">上传文件</a>
                    @endif
                </td>
            </tr>
@endforeach
            </tbody>
        </table>
    </div>
<div style="margin-left: 40%;">
    @if ($videos->render())
        <div class="pagination">{!! $videos->render() !!}</div>
    @endif
</div>

@stop
<div class="modal fade bs-example-modal-lg text-center" id="imgModal" tabindex="-1" role="dialog" data-toggle="modal" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="display:inline-block;width:auto;">
        <div class="modal-content">
            <div id="imgshow"></div>
        </div>
    </div>
</div>
<script>
    function showdata(vid) {
          alert('稍后访问！'); return false;
        $("#ifm").attr("src", '{{ url('admin/video/preview_video?vid=')}}'+vid+'');//JQuery动态加载iframe。
    }

    function showMaxImg(obj){
        var src=$(obj).attr("src");
        $("#imgModal").find("#imgshow").html("<img src='"+src+"' class='carousel-inner img-responsive img-rounded' data-dismiss='modal'>");
        $("#imgModal").modal('show');
    }
</script>

