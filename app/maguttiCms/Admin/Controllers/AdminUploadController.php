<?php namespace App\maguttiCms\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\maguttiCms\Sluggable;
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


/**
 * Class AdminPagesController
 * @package App\maguttiCms\Admin\Controllers
 */
class AdminUploadController extends Controller
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
    }


/*
* @param    int        $length  输出长度
* @param    string     $chars   可选的 ，默认为 0123456789
* @return   string     字符串
*/
    function random($length, $chars = '0123456789') {
        $hash = '';
        $max = strlen ( $chars ) - 1;
        for($i = 0; $i < $length; $i ++) {
            $hash .= $chars [mt_rand ( 0, $max )];
        }
        return $hash;
    }

    /**
     * ugc接口生成login的refresh_token
     */
    public function make_refresh_tocken($uid){
        $rand=$this->random(16,'abcdefghigklmnopqrstuvwxwyABCDEFGHIGKLMNOPQRSTUVWXWY0123456789') .'8973817';
        $refresh_token=$this->xxtea->encrypt($rand,time().'');

       // return 	$refresh_token;
    }

   public function upload(){
       $login =  $this->ugc_login($this->uid,$this->accesstoken);
       return view('admin.upload',['accesstoken'=>$login,'uid'=>$this->uid]);
   }


    function my_file_get_contents($url, $timeout=30) {
        $stream = stream_context_create(array('http' => array('timeout' => $timeout)));
        return @file_get_contents($url, 0, $stream);
    }

    function ugc_login($uid,$accesstoken){
        $login_url ='http://v.cuctv.com/ugc/login?sid='.$this->sid.'&uid='.$uid.'&check=1&accesstoken='.$accesstoken.'&key='.$this->key;


        $login_rs = $this->my_file_get_contents($login_url);
        $login_rs = json_decode($login_rs,true);
        if($login_rs['result'] == 1){
            return $login_rs['data']['refresh_token'];
        }elseif($login_rs['result'] == 107){
            $accesstoken = $login_rs['data'];
            $this->system_config_db->set_config(2,array('uid'=>$uid,'accesstoken'=>$accesstoken));
            $this->ugc_login($uid, $accesstoken);
        }
    }


}