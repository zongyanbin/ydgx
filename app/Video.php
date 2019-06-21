<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use \App\maguttiCms\Translatable\GFTranslatableHelperTrait;


class Video extends Model
{
    protected  $table = 'videos';
    protected  $primaryKey = 'id';
    public $timestamps = false;
    /**
     * 得到视频播放时长
     */
    function getvideoplaytime($duration,$f=':'){
        $sec = $duration/1000;
        $h   = floor($sec/3600);
        $ms  = $sec % 3600;
        $m   = floor($ms/60);
        $m   = str_pad($m,'2','0',STR_PAD_LEFT);
        $s   = $ms%60;
        $s   = str_pad($s,'2','0',STR_PAD_LEFT);
        return $h > 0 ? $h.$f.$m.$f.$s : $m.$f.$s;
    }
}
