<?php

/*
|--------------------------------------------------------------------------
| ADMIN Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/


use App\maguttiCms\Middleware\AdminRole;
Route::get('/test',                                 '\App\Http\Controllers\TestController@index');

\Illuminate\Support\Facades\Auth::loginUsingId(1); //用户id为1的登录

Route::get('/clear', function() {
    Artisan::call('cache:clear');
    return "Cache is cleared";
});

//Route::get('users/{user}', logoutfunction (App\User $user) {
//    return $user->email;
//});
//\Illuminate\Support\Facades\Auth::loginUsingId(1); //用户id为1的登录
//显示文章和相应的评论
Route::get('/post/show/{post}', function (App\Post $post) {
   // $post->load('comment.owner');
    $post->load('comments.owner');

    $comments = $post->getComments();
    $comments['root'] = $comments[$post['id']];
    unset($comments[$post['id']]);
    return view('posts.show', compact('post', 'comments'));
});


Route::get('/users/post', 'PostController@index');
Route::post('/users/post/{post}/comments', 'CommentsController@store');

Route::get('/post/{post}', 'PostController@show')->name('post.show');
//用户进行评论
Route::post('post/{post}/comments', function (App\Post $post) {
    $post->comments()->create([
        'body' => request('body'),
        'user_id' =>\Illuminate\Support\Facades\Auth::id(),
        'parent_id' => request('parent_id', null),
    ]);
    return back();
});


Route::group(array('prefix' => 'admin', 'namespace' => 'Admin', 'middleware' => ['adminauth', 'setlocaleadmin']), function () {


    Route::any('/file', '\App\maguttiCms\Admin\Controllers\FileController@file');
    //后台上传视频
    Route::get('/upload', '\App\maguttiCms\Admin\Controllers\AdminUploadController@upload');
    Route::get('/',                                 '\App\maguttiCms\Admin\Controllers\AdminPagesController@home');
    Route::get('/list/{section?}/{sub?}',           '\App\maguttiCms\Admin\Controllers\AdminPagesController@lista')->middleware(AdminRole::class);
    Route::get('/create/{section}',                 '\App\maguttiCms\Admin\Controllers\AdminPagesController@create')->middleware(AdminRole::class);
    Route::post('/create/{section}',                '\App\maguttiCms\Admin\Controllers\AdminPagesController@store');

    Route::get('/edit/{section}/{id?}/{type?}',     '\App\maguttiCms\Admin\Controllers\AdminPagesController@edit');
    Route::post('/edit/{section}/{id?}',            '\App\maguttiCms\Admin\Controllers\AdminPagesController@update');

	Route::get('/file_view/{section}/{id}/{key}',   '\App\maguttiCms\Admin\Controllers\AdminPagesController@file_view');

    Route::get('/editmodal/{section}/{id?}/{type?}','\App\maguttiCms\Admin\Controllers\AdminPagesController@editmodal');
    Route::post('/editmodal/{section}/{id?}',       '\App\maguttiCms\Admin\Controllers\AdminPagesController@updatemodal');
    Route::get('/delete/{section}/{id?}',           '\App\maguttiCms\Admin\Controllers\AdminPagesController@destroy');

    Route::get('/duplicate/{section}/{id?}/{type?}','\App\maguttiCms\Admin\Controllers\AdminPagesController@duplicate');

    Route::group(array( 'prefix' => 'impersonated','middleware' => ['adminimpersonate']), function () {
        Route::get('/adminusers/{id?}',  '\App\maguttiCms\Admin\Controllers\AdminImpersonateController@impersonateadmin');
        Route::get('/users/{id?}',   '\App\maguttiCms\Admin\Controllers\AdminImpersonateController@impersonateuser');
    });

    /*
    |--------------------------------------------------------------------------
    | API
    |--------------------------------------------------------------------------
    */
    Route::group(array('prefix' => 'api'), function () {

        Route::get('update/{method}/{model?}/{id?}',        '\App\maguttiCms\Admin\Controllers\AjaxController@update');
        Route::get('delete/{model?}/{id?}',                 '\App\maguttiCms\Admin\Controllers\AjaxController@delete');

        /*
        |--------------------------------------------------------------------------
        | MEDIA LIBRARY
        |--------------------------------------------------------------------------
        */
        Route::post('uploadifiveSingle/',                    '\App\maguttiCms\Admin\Controllers\AjaxController@uploadifiveSingle');
        Route::post('uploadifiveMedia/',                    '\App\maguttiCms\Admin\Controllers\AjaxController@uploadifiveMedia');
        Route::post('cropperMedia/',                    '\App\maguttiCms\Admin\Controllers\AjaxController@cropperMedia');
        Route::get('updateHtml/media/{model?}','\App\maguttiCms\Admin\Controllers\AjaxController@updateModelMediaList');
        Route::get('updateHtml/{mediaType?}/{model?}/{id?}','\App\maguttiCms\Admin\Controllers\AjaxController@updateMediaList');
        Route::get('updateMediaSortList/',                  '\App\maguttiCms\Admin\Controllers\AjaxController@updateMediaSortList');
        Route::get('suggest', ['as' => 'api.suggest', 'uses' => '\App\maguttiCms\Admin\Controllers\AjaxController@suggest']);
        Route::get('dashboard','\App\MaguttiCms\Api\V1\Controllers\AdminServicesController@dashboard');

        /*
        |--------------------------------------------------------------------------
        | FILE MANANGER
        |--------------------------------------------------------------------------
        */
        Route::post('filemanager/upload', '\App\maguttiCms\Admin\Controllers\AjaxController@uploadFileManager');
        Route::get('filemanager/list/{id?}', '\App\maguttiCms\Admin\Controllers\AjaxController@getFileManagerList');
        Route::get('filemanager/edit/{id}', '\App\maguttiCms\Admin\Controllers\AjaxController@editFileManager');
        Route::post('filemanager/edit/{id}', '\App\maguttiCms\Admin\Controllers\AjaxController@updateFileManager');

    });

    Route::get('/exportlist/{section?}/{sub?}', '\App\maguttiCms\Admin\Controllers\AdminExportController@lista');
});

/*
|--------------------------------------------------------------------------
| ADMIN AUTH
|--------------------------------------------------------------------------
*/
Route::group(array('prefix' => 'admin'), function () {




    Route::any('video','\App\maguttiCms\Admin\Controllers\VideoController@index');
    //Preview video
    Route::any('video/preview_video','\App\maguttiCms\Admin\Controllers\VideoController@preview_video');

    // Admin Auth and Password routes...
    Route::get('login',  '\App\maguttiCms\Admin\Controllers\Auth\LoginController@showLoginForm');
    Route::post('login', '\App\maguttiCms\Admin\Controllers\Auth\LoginController@login');
    Route::get('logout', '\App\maguttiCms\Admin\Controllers\Auth\LoginController@logout');

    // Password Reset Routes...
    Route::get('password/reset',         '\App\maguttiCms\Admin\Controllers\Auth\ForgotPasswordController@showLinkRequestForm');
	Route::post('password/email',        '\App\maguttiCms\Admin\Controllers\Auth\ForgotPasswordController@sendResetLinkEmail');
	Route::post('password/reset',        '\App\maguttiCms\Admin\Controllers\Auth\ResetPasswordController@reset');
	Route::get('password/reset/{token}', '\App\maguttiCms\Admin\Controllers\Auth\ResetPasswordController@showResetForm');
});

// api
Route::group(['prefix' => 'api'], function () {
	Route::post('/update-ghost',		'\App\maguttiCms\Website\Controllers\APIController@updateGhost');

	// store
	Route::post('/store/cart-item-add',		'\App\maguttiCms\Website\Controllers\StoreAPIController@storeCartItemAdd');
	Route::post('/store/cart-item-remove',	'\App\maguttiCms\Website\Controllers\StoreAPIController@storeCartitemRemove');
	Route::get('/store/order-calc',		'\App\maguttiCms\Website\Controllers\StoreAPIController@storeOrderCalc');
	Route::get('/store/order-discount',	'\App\maguttiCms\Website\Controllers\StoreAPIController@storeOrderDiscount');
});

/*
|--------------------------------------------------------------------------
| FRONT END
|--------------------------------------------------------------------------
*/

Route::group([
  'prefix' => LaravelLocalization::setLocale(),
  'middleware' => ['shield', 'localizationRedirect', 'usercart']
], function () {
	// Api
	Route::post('/api/newsletter',			'\App\maguttiCms\Website\Controllers\APIController@subscribeNewsletter');



    // Authentication routes...
    Route::get('users/login', '\App\maguttiCms\Website\Controllers\Auth\LoginController@showLoginForm')->name('users/login');
    Route::post('users/login','\App\maguttiCms\Website\Controllers\Auth\LoginController@login');
    Route::get('users/logout','\App\maguttiCms\Website\Controllers\Auth\LoginController@logout');

	// Reserved area user routes
	Route::group(['middleware' => ['auth']], function () {

	    //my  access  begin

        // user personal information
        Route::any('users/personal','\App\maguttiCms\Website\Controllers\ReservedAreaController@personal');
        //my users center  set access
        Route::any('users/center','\App\maguttiCms\Website\Controllers\ReservedAreaController@my_users_center');
        //my  access  end



	    Route::get('users/dashboard',    '\App\maguttiCms\Website\Controllers\ReservedAreaController@dashboard');
		Route::get('users/address-new',    '\App\maguttiCms\Website\Controllers\ReservedAreaController@addressNew');
		Route::post('users/address-new',    '\App\maguttiCms\Website\Controllers\ReservedAreaController@addressCreate');
	    Route::get('users/profile','\App\maguttiCms\Website\Controllers\ReservedAreaController@profile');

        //UserName update password
        Route::any('users/reset','\App\maguttiCms\Website\Controllers\ReservedAreaController@reset');
        Route::any('users/postreset','\App\maguttiCms\Website\Controllers\ReservedAreaController@postreset');
	});

    // Registration routes...
    Route::get('/register', '\App\maguttiCms\Website\Controllers\Auth\RegisterController@showRegistrationForm');
    Route::post('/register','\App\maguttiCms\Website\Controllers\Auth\RegisterController@register');




    // set code
    Route::any('getcode ','\App\maguttiCms\Website\Controllers\Auth\RegisterController@loginDo');
    Route::any('password/getcode ','\App\maguttiCms\Website\Controllers\Auth\RegisterController@loginDo');

    // Password Reset Routes...
    Route::get('password/reset',        '\App\maguttiCms\Website\Controllers\Auth\ForgotPasswordController@showLinkRequestForm');
    Route::post('password/email',       '\App\maguttiCms\Website\Controllers\Auth\ForgotPasswordController@sendResetLinkEmail');
    Route::get('password/reset/{token}','\App\maguttiCms\Website\Controllers\Auth\ResetPasswordController@showResetForm');
    Route::post('password/reset',       '\App\maguttiCms\Website\Controllers\Auth\ResetPasswordController@reset');


    //Not Logged in
    Route::any('password/phone',       '\App\maguttiCms\Website\Controllers\Auth\ForgotPasswordController@sendResetLinkPhone');

    //my custon Rules

    //routes my courses url
    Route::any('users/my_courses','\App\maguttiCms\Website\Controllers\ReservedAreaController@my_courses');

    //bought
    Route::any('users/bought','\App\maguttiCms\Website\Controllers\ReservedAreaController@my_bought');


    // buy video
    Route::get('/class/buy_video',                     '\App\maguttiCms\Website\Controllers\ClassVideoController@buy_video');
    Route::get('/class/bought_video',                     '\App\maguttiCms\Website\Controllers\ClassVideoController@bought_video');

    // Pages routes...
    Route::get('/',                     '\App\maguttiCms\Website\Controllers\PagesController@home');
    Route::get('/news/',                '\App\maguttiCms\Website\Controllers\PagesController@news');
    Route::get('/news/{slug}',          '\App\maguttiCms\Website\Controllers\PagesController@news');
    Route::get(LaravelLocalization::transRoute("routes.category"),	'\App\maguttiCms\Website\Controllers\ProductsController@category');
    Route::get(LaravelLocalization::transRoute("routes.products"),	'\App\maguttiCms\Website\Controllers\ProductsController@products');
	Route::get(LaravelLocalization::transRoute("routes.contacts"),	'\App\maguttiCms\Website\Controllers\PagesController@contacts');
    Route::post('/contacts/',		    '\App\maguttiCms\Website\Controllers\WebsiteFormController@getContactUsForm');



    Route::get('/class/pay',				'\App\maguttiCms\Website\Controllers\StoreController@class_pay')->middleware('storeenabled');

	Route::get('/cart/',				'\App\maguttiCms\Website\Controllers\StoreController@cart')->middleware('storeenabled');
	Route::get('/order-login/',		    '\App\maguttiCms\Website\Controllers\StoreController@orderLogin')->middleware(['storeenabled']);
	Route::get('/order-submit/',		'\App\maguttiCms\Website\Controllers\StoreController@orderSubmit')->middleware(['storeenabled']);
	Route::post('/order-submit/',		'\App\maguttiCms\Website\Controllers\StoreController@orderCreate')->middleware(['storeenabled', 'auth']);
	Route::get('/order-review/{token}',	'\App\maguttiCms\Website\Controllers\StoreController@orderReview')->middleware(['storeenabled', 'auth']);
	Route::post('/order-payment/',		'\App\maguttiCms\Website\Controllers\StoreController@orderPayment')->middleware(['storeenabled', 'auth']);
	Route::get('/order-payment-cancel/{token}',	'\App\maguttiCms\Website\Controllers\StoreController@orderCancel')->middleware(['storeenabled', 'auth']);
	Route::get('/order-payment-confirm/{token}','\App\maguttiCms\Website\Controllers\StoreController@orderConfirm')->middleware(['storeenabled', 'auth']);
	Route::get('/order-payment-result/{token}',	'\App\maguttiCms\Website\Controllers\StoreController@orderResult')->middleware(['storeenabled', 'auth']);

	// Seo landing pages
	foreach (config('maguttiCms.website.seolanding') as $_link) {
		Route::get($_link['route'],		    '\App\maguttiCms\Website\Controllers\SeoLandingController@'.$_link['method'])->where($_link['constraints']);
	}

    Route::get('/{parent}/{child}', '\App\maguttiCms\Website\Controllers\PagesController@pages');
    Route::get('/{parent?}/', '\App\maguttiCms\Website\Controllers\PagesController@pages');
});
