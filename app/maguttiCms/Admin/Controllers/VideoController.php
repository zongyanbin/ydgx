<?php namespace App\maguttiCms\Admin\Controllers;


use App\Http\Controllers\Controller;
use App\maguttiCms\Sluggable;
use App\Video;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
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


/**
 * Class AdminPagesController
 * @package App\maguttiCms\Admin\Controllers
 */
class VideoController extends Controller
{
    private $system_config_db;
    private $sid  = '1020';
    private $auth = '6O7rm1qTyV3_NQdqLiqnvox843aaWXS4';
    private $uid = '9687388';  //8973817
    private $accesstoken ='MNL_21pUhk3MvxX-0nN5gUkUtgJSjgIubUNsR2f1sPI.';
    private $key;
    private $ugc_reg_api;
    private $xxtea;
    private $ugc_video_list_api;
    private $ugc_audio_list_api;
    private $page;

    function __construct() {
        $this->xxtea = new \App\maguttiCms\Tools\Xxtea();
        $this->key = $this->xxtea->encrypt($this->sid,$this->auth);
        $this->ugc_video_list_api = 'http://v.cuctv.com/ugc/change_videos';

        $this->video = new Video();
    }

    function my_file_get_contents($url, $timeout=30) {
        $stream = stream_context_create(array('http' => array('timeout' => $timeout)));
        return @file_get_contents($url, 0, $stream);
    }

    //视频列表
    public function index(Request $request)
    {

           $data = new Video();
            $rest = Video::get();
            $this->ugc_video_list_api = 'http://v.cuctv.com/ugc/change_videos';
            $page = 1;
            $url = $this->ugc_video_list_api.'?sid='.$this->sid.'&key='.$this->key.'&limit=100&page='.$page;
            $result = $this->my_file_get_contents($url);
            $result = json_decode($result,true);
            $vlist  = array();

        if(!empty($result['data']['list']) && is_array($result['data']['list'])){
            foreach($result['data']['list'] as $list){

                $info = Video::where('vid','=',$list['vid_code'])->first();
                $data->vid =time();
                $data->title = $list['title'];
                $data->thumb = $list['imgurl'];
                $data->keyword = preg_replace("/\s+/", ',', $list['tags']);
                $data->pushed = '1';
                $data->description = $list['description'];
                $data->duration = $list['duration'];
                $data->video_status = $list['status'];
                $data->createtime = time();

                if($info['id']){
                    $update = Video::find($info['id']);
                    $update->vid =time();
                    $update->title = $list['title'];
                    $update->thumb = $list['imgurl'];
                    $update->keyword = preg_replace("/\s+/", ',', $list['tags']);
                    $update->pushed = '1';
                    $update->description = $list['description'];
                    $update->duration = $list['duration'];
                    $update->video_status = $list['status'];
                    $update->createtime = time();
                    $update->save();
                }else{
                    $data->vid = $list['vid_code'];
                    $bool = $data->save();
                }

            }
        }


        $videos = Video:: orderBy('id','desc') -> paginate(5);

        if($videos){
            foreach ($videos as $key =>&$val){
                $val->duration= $this->video->getvideoplaytime($val->duration);
            }
        }


       $urlpu = $this->get_host().'/uploads';

        return view('admin.video.index',['videos'=>$videos,'urlpu'=>$urlpu]);
    }

    function get_host(){
        $scheme = empty($_SERVER['HTTPS']) ? 'http://' : 'https://';
        $url = $scheme.$_SERVER['HTTP_HOST'];
        return $url;
    }

    /**
     * 预览视频
     */
    function preview_video(Request $request)
    {//Rs3QwE8JISw Request $reques
        $r_vid = $request->vid;
        $url = 'http://v.cuctv.com/fetch/video_'.$r_vid.'.htm?r=&fromcms=1&t='.time();
        $res = $this->curl_get_https($url);

        $arr_view = array();
        $arr  = \GuzzleHttp\json_decode($res,true);
        if($arr['result']!=1){
            var_dump($res); exit;
        }

        if($arr['result'] ==1 && $arr['data']['list']){

            $res =current($arr['data']['list']);
            $arr_view['first'] = $res['playurl'];
            if($arr['data']['list']){
                $list = $arr['data']['list'] ;
                foreach ( $list as $key=>$val){
                    $arr_view['two'][$key]  =$list[$key]['playurl'];
                }
            }

        }


         if(count($arr_view['two'])>=1){
             unset($arr_view['two']['0']);
             $str  = implode(",",$arr_view['two']);
         }else{
             $str  = current($arr_view['two']);
         }

         unset($arr_view['two']);
         $arr_view['list'] =$str;

        var_dump($arr_view); exit;

    // exit;
        return  view('admin.video.preview_video',['arr_view'=>$arr_view]);
    }

    function curl_get_https($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.1 Safari/537.11');
        $res = curl_exec($ch);
        $rescode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        return $res;
    }

}