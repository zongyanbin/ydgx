<?php namespace App\maguttiCms\Website\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\maguttiCms\Tools\StoreHelper;
use App\maguttiCms\Website\Repos\Article\ArticleRepositoryInterface;
use App\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Validator;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */


    use \App\maguttiCms\SeoTools\maguttiCmsSeoTrait;


    use RegistersUsers;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/';
    /**
     * @var ArticleRepositoryInterface
     */
    protected  $articleRepo;
    var $localePrefix;

    /**
     * RegisterController constructor.
     * @param ArticleRepositoryInterface $article
     */
    public function __construct(ArticleRepositoryInterface $article)
    {
        $this->middleware('guest');
        $this->localePrefix         = get_locale();
        $this->redirectTo           = $this->localePrefix.'/';
        $this->articleRepo          = $article;

    }

    public function showRegistrationForm()
    {
        $article = $this->articleRepo->getBySlug('register');
        $this->setSeo($article);
        return view('website.auth.register',compact('article'));
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     * .config('maguttiCms.security.password_regex')
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'phone' => 'required|max:255|unique:users',
            'password' => 'required|min:6',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return User
     */
    protected function create(array $data)
    {
        return User::create([
            'phone' => $data['phone'],
            'name' => $data['phone'],
            'password' => $data['password'],
        ]);
    }

	/**
     * Handle a registration request for the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function rand_captcha() {
        $key = '';
       // $pattern='1234567890abcdefghijkmnpqrstuvwxyz'; // 无 l o
        $pattern='1234567890'; // 无 l o
        for( $i=0; $i<4; $i++ ) {
            $key .= $pattern[mt_rand(0, 9)];
        }
        return $key;
    }


    public function register(Request $request)
    {
        $authnum =$request->input('authnum');
        session_start();//将随机数存入session中
        if(empty($authnum)){
            return back()->withErrors(['手机验证码不能为空！']);
        }elseif($_SESSION['authnum'] !=$authnum){
            return back()->withErrors(['验证码错误，请重输入！']);
        }

        $this->validator($request->all())->validate();

        if ($request->redirectTo) {
            // If the redirect to path is in white list.
            if(in_array($request->redirectTo, config('maguttiCms.security.redirectTo')) == true) {
               $this->redirectTo = $request->redirectTo;
            }
        }

        event(new Registered($user = $this->create($request->all())));

        $this->guard()->login($user);

		// if the guet has an active cart, set it to his new user
		if (StoreHelper::isStoreEnabled()) {
			$cart = StoreHelper::getSessionCart();
			if ($cart) {
				$cart->user()->associate($user);
				$cart->save();
				StoreHelper::setSessionCart($cart);
			}
		}

        return $this->registered($request, $user)
                        ?: redirect($this->redirectPath());
    }

    /**
     * Send verification code
     */
    public function loginDo()
    {
        $authnum = $this->rand_captcha();
        session_start();//将随机数存入session中
        $_SESSION['authnum']=$authnum;


        $type  =isset($_GET['type'])?$_GET['type']:'';
        if($type ==2){
            $typeurl = 'send_find_pwd_code';
        }else{
            $typeurl ='send_reg_code';
        }
        $iphone = $_GET['iphone'];
        $url = 'http://common.topclassx.com/sms/'.$typeurl.'?&mobile=' . $iphone . '&code=' . $authnum ;
        $data = array();
        $method = 'GET';
        $res = $this->curlPost($url, $data, $method);
        $res='OK';
        if($res=='OK'){
            $arr = array(
                'msg' => array(
                    'stat' => '100',
                    'message' => '短信发送成功了!',
                )
            );

        }else{
            $arr = array(
                'msg' => array(
                    'message' => $res,
                )
            );

        }

        $json_string = json_encode($arr);
        echo $json_string;
    }

    function send_sms_mandao($phone,$msg,$ext=''){
        //漫道接口
        $sn = 'SDK-BBX-010-20375';
        $pwd = '09@ecdc@';
        $host = 'http://sdk2.entinfo.cn:8060';
        $send_url = $host.'/z_mdsmssend.aspx';
        $postdata['sn'] = $sn;
        $postdata['pwd'] = strtoupper(md5($sn.$pwd));
        $postdata['mobile'] = $phone;
        $postdata['content'] = iconv("UTF-8", "gb2312//IGNORE", $msg);//接收gb2312编码格式
        $postdata['ext'] = $ext;
        $postdata['rrid'] = '';
        $postdata['stime'] = '';


        $aa =  $this->curlPost($send_url,$postdata,'POST');
        var_dump($aa); exit;

    }

    /*curlpost*/
    public function curlPost($url, $data, $method)
    {
        $ch = curl_init(); //1.初始化
        curl_setopt($ch, CURLOPT_URL, $url); //2.请求地址
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);//3.请求方式
        //4.参数如下
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);//https
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)');//模拟浏览器
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept-Encoding: gzip, deflate'));//gzip解压内容
        curl_setopt($ch, CURLOPT_ENCODING, 'gzip,deflate');
        if ($method == "POST") {//5.post方式的时候添加数据
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        }
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $tmpInfo = curl_exec($ch);//6.执行
        if (curl_errno($ch)) {//7.如果出错
            return curl_error($ch);
        }
        curl_close($ch);//8.关闭
        return $tmpInfo;
    }
}
