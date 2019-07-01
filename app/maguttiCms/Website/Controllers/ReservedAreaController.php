<?php

namespace App\maguttiCms\Website\Controllers;

use App\maguttiCms\Website\Requests\WebsiteFormRequest;
use App\Country;
use App\Address;
use App\Http\Controllers\Controller;
use App\maguttiCms\Website\Repos\Article\ArticleRepositoryInterface;
use App\User;
use Auth;
use Illuminate\Http\Request;
use Input;
use Validator;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Hash;

class ReservedAreaController extends Controller

{
	use \App\maguttiCms\SeoTools\maguttiCmsSeoTrait;
    /**
     * @var
     */
    protected  $template;
    /**
     * @var ArticleRepositoryInterface
     */
    protected  $articleRepo;


    /**
     * @param ArticleRepositoryInterface $article
     *
     */

    public function __construct(ArticleRepositoryInterface $article )
    {
        $this->articleRepo = $article;
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function dashboard()
    {
        $article =$this->articleRepo->getBySlug('dashboard');
        $this->setSeo($article);
		$user = Auth::user();
		$orders = $user->orders()->list()->get();
		$addresses = $user->addresses;
        return view('website.users.dashboard', compact('article', 'orders', 'addresses'));
    }

    public function profile()
    {
        $article =$this->articleRepo->getBySlug('profile');
        $this->setSeo($article);
        return view('website.users.profile', compact('article'));
    }

	public function addressNew()
	{
		$previous = url()->previous();
		$countries = Country::list()->get();
		return view('website.users.address_new', compact('countries', 'previous'));
	}

	public function personal(Request $request)
    {
        $auths =Auth::guard()->check();
        if (!$auths) {
            return redirect('/');
        }

        $id = Auth::user()->id;
        $personal = User::find($id);

        if($request->isMethod('POST')){


            $this->validate($request, [
                'personal.name' => 'required|min:2|max:20',

            ], [
                'required' => ':attribute 为必填项',
                'min' => ':attribute 长度不符合要求',
                'integer' => ':attribute 必须为整数',
            ], [
                'personal.name' => '姓名',
                'personal.face_picture' => '头像',
            ]);

            $data = $request->input('personal');
            $personal->name = $data['name'];
            $personal->face_picture = $data['face_picture'];
            if ($personal->save()) {
                return redirect('users/personal')->with('success', '更新成功！');
            }

        }

        return view('website.users.front_personal',compact('personal'));
    }
	public function addressCreate(WebsiteFormRequest $request)
	{
		$user = Auth::user();

		$address = Address::create([
			'user_id'	 => $user->id,
			'street'	 => $request->street,
			'number'	 => $request->number,
			'zip_code'	 => $request->zip_code,
			'city'	     => $request->city,
			'province'	 => $request->province,
			'country_id' => $request->country_id,
			'phone'	     => $request->phone,
			'mobile'	 => $request->mobile,
			'email'	     => $request->email,
			'vat'		 => $request->vat
		]);

		if ($request->previous)
			return Redirect::to($request->previous);
		else
			return Redirect::to('/users/dashboard');
	}

	public function reset(Request $request)
    {
        if($request->isMethod('POST')){
            $oldpassword = $request->input('oldpassword');
            $password = $request->input('password');
            $data = $request->all();
            $rules = [
                'oldpassword'=>'required|between:6,20',
                'password'=>'required|between:6,20|confirmed',
            ];
            $messages = [
                'required' => '密码不能为空',
                'between' => '密码必须是6~20位之间',
                'confirmed' => '新密码和确认密码不匹配'
            ];
            $validator = Validator::make($data, $rules, $messages);
            $user = Auth::user();
            $validator->after(function($validator) use ($oldpassword, $user) {
                if (!\Hash::check($oldpassword, $user->password)) {
                    $validator->errors()->add('oldpassword', '原密码错误');
                }
            });
            if ($validator->fails()) {
                return back()->withErrors($validator);  //返回一次性错误
            }

            $user->password = $password;
            $user->save();
            Auth::logout();  //更改完这次密码后，退出这个用户
            return redirect('/login');

        }

        return view('website.users.reset');
    }

    //users information
    public function postreset(Request $request)
    {
        if(!Hash::check ($request->input('oldpassword'),Auth()->user ()->password)){
            session()->flash('danger','原密码不正确');
            return redirect ()->back();
        }
        $user=\Auth::user ();
        $user->password=bcrypt($request->input('password'));
        $user->save();
        session()->flash('success','密码修改成功！');
        return redirect ('/');
    }
    //my courses
    public function my_courses()
    {
        return view('website.users.my_courses');
    }

    //users center
    public function my_users_center()
    {
        return view('website.users.my_users_center');
    }

    //my bought
    public function my_bought()
    {
        return view('website.users.my_bought');
    }

    public function my_users_info()
    {
        $id = Auth::user()->id;
        $personal = User::find($id);
        return view('website.users.my_users_info',compact('personal'));
    }

}
