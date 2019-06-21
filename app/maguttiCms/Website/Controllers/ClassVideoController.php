<?php
namespace App\maguttiCms\Website\Controllers;
use App\Http\Controllers\Controller;
use App\maguttiCms\Tools\StoreHelper;
use App\maguttiCms\Website\Requests\WebsiteFormRequest;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Input;
class  ClassVideoController extends Controller
{
    public function __construct()
    {
    }

    public function buy_video()
    {
        return view('website.classvideo.buy_video');
    }

    public function bought_video(){
        return view('website.classvideo.bought_video');
    }
}