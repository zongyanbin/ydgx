<?php namespace App\maguttiCms\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\maguttiCms\Sluggable;
use App\Video;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Validator;
use Input;
use Auth;

use App\Http;
use App\Lib\Xxtea;
use \App\maguttiCms\Admin\Helpers\AdminUserTrackerTrait;
use App\maguttiCms\Admin\Requests\AdminFormRequest;
use App\maguttiCms\Searchable\SearchableTrait;
use App\maguttiCms\Sluggable\SluggableTrait;
use App\maguttiCms\Tools\UploadManager;
use Illuminate\Support\Facades\Storage;


use App\Http\Requests;



class FileController extends Controller
{

    public function file(Request $request){

        $id = $request->input('id');
        $video = Video::find($id);

       $page = $request->input('page');
        if($page){
            $bak_url= '/admin/video?page='.$page;
        }else{
            $bak_url = '/admin/video';
        }

        if ($request->isMethod('POST')){
            $file = $request->file('source');
            //判断文件是否上传成功
            if ($file->isValid()){
                //原文件名
                $originalName = $file->getClientOriginalName();
                //扩展名
                $ext = $file->getClientOriginalExtension();
                //MimeType
                $type = $file->getClientMimeType();
                //临时绝对路径
                $realPath = $file->getRealPath();
                $filename = date('Y-m-d-H-i-s').'-'.uniqid().'.'.$ext;
                $dates = date('Ymd',time()).'/';
                $bool = Storage::disk('uploads')->put($filename,file_get_contents($realPath));

                $video->fileurl = $dates.$filename;
                $video->save();

                //判断是否上传成功
                if($bool){
                    return redirect('/admin/video')->with('success', '修改成功-' . $id);
                }else{
                    echo 'fail';
                }
            }
        }
        return view('admin.file.index');
    }
    public function download(){

    }

}