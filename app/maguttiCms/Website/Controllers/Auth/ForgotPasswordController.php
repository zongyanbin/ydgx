<?php namespace App\maguttiCms\Website\Controllers\Auth;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use App\maguttiCms\Website\Repos\Article\ArticleRepositoryInterface;
use Illuminate\Support\Facades\Auth;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
    */
    use SendsPasswordResetEmails;

    use \App\maguttiCms\SeoTools\maguttiCmsSeoTrait;
    protected  $articleRepo;
    public  $authnum;

    public function __construct(ArticleRepositoryInterface $article)
    {
        $this->middleware('guest');
        $this->articleRepo = $article;
    }

    public function showLinkRequestForm()
    {
        $article = $this->articleRepo->getBySlug('home');
        $this->setSeo($article);
        \SEO::setTitle( trans('message.password_forgot') );
        return view('website.auth.password',compact('article'));
    }

    public function sendResetLinkPhone(Request $request)
    {



        if($request->ajax()) {
            $authnum = $request->input('authnum');
           // dd($data);
            session_start();//将随机数存入session中
            $session_authnum = !empty($_SESSION['authnum'])?$_SESSION['authnum']:'';
            if(empty($authnum)){
                $arr = array(
                    'msg' => array(
                        'stat' => '300',
                        'message' => '手机验证码不能为空!',
                    )
                );
            }elseif($session_authnum !=$authnum){
                $arr = array(
                    'msg' => array(
                        'stat' => '200',
                        'message' => '验证码错误，请重输入！!',
                    )
                );

            }elseif ($session_authnum==$authnum){
                $arr = array(
                    'msg' => array(
                        'stat' => '100',
                        'message' => '验证成功',
                    )
                );
            }

            $json_string = json_encode($arr);
            echo $json_string;
            exit;

        }

        if($request->isMethod('POST')){
            $authnum =$request->input('authnum');
            session_start();//将随机数存入session中
            $session_authnum = !empty($_SESSION['authnum'])?$_SESSION['authnum']:'';
            if(empty($authnum)){
                return back()->withErrors(['手机验证码不能为空！']);
            }elseif($session_authnum!=$authnum){
                return back()->withErrors(['验证码错误，请重输入！']);
            }


            $request_users =$request->input('users');

            //first() 查询第一条
            $select_user=User::where('phone','=',$request_users['phone'])->first();
            $id =$select_user->id;
            $users  = User::find($id);
          //  dd($uses); exit;
            $this->validate($request, [
                'users.password' => 'required|min:2|max:20',

            ], [
                'required' => ':attribute 为必填项',
                'min' => ':attribute 长度不符合要求',
            ], [
                'uses.password' => '密码',
            ]);

            $users->password = $request_users['password'];
            if ($users->save()) {
                return redirect('/users/login')->with('success', '密码找回成功！');
            }

        }

    }
}
