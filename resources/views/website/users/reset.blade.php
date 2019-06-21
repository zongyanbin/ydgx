@extends('website.common.header_layouts')
 <!--||$errors->any()-->
@if (false)
    <div class='text-center alert alert-info'>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">{{icon('times')}}</button>
        {{icon('exclamation-circle', 'fa-3x')}}

        @foreach ( $errors->all() as $error)
            <p>{{ $error }}</p>
        @endforeach
    </div>
@endif

<main class=" width:100%"  style="color: #ffffff;">
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-sm-push-3 col-md-4 col-md-push-4">
            <form class="login-form" action="" method="post">
                <h3 class="font-green text-center" style="margin: 2rem;">修改密码</h3>
                @if($errors->first())
                    @if ($errors->any())
                        <div class='text-center alert alert-info'>
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">{{icon('times')}}</button>
                            {{icon('exclamation-circle', 'fa-3x')}}

                            @foreach ( $errors->all() as $error)
                                <p>{{ $error }}</p>
                            @endforeach
                        </div>
                    @endif

                @endif
                {!! csrf_field() !!}
                <div class="form-group">
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="原始密码" name="oldpassword"> </div>
                <div class="form-group">
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_password" placeholder="新密码" name="password"> </div>
                <div class="form-group">
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="确认密码" name="password_confirmation"> </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-danger btn-primary btn-block">确定</button>
                </div>
            </form>
        </div>
    </div>
</main>