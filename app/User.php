<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

use App\maguttiCms\Notifications\UserResetPasswordNotification as UserResetPasswordNotification;
use App\maguttiCms\Permission\GFEntrustUserTrait;

class User extends Authenticatable
{
    use Notifiable;
    use GFEntrustUserTrait; // add this trait to your user model

    protected $role_user_table = "role_user";
    protected $user_foreign_key = "user_id";

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'gender',
		'list_code',
        'phone',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $fieldspec = [];

	public function orders()
	{
		return $this->hasMany('App\Order');
	}

	public function addresses()
	{
		return $this->hasMany('App\Address');
	}

    /**
     * @param $roles
     */
    public function saveRoles($roles)
    {
        if (!empty($roles)) {
            $this->roles()->sync($roles);
        } else {
            $this->roles()->detach();
        }
    }

    /**
     * @param $password
     */
    public function setPasswordAttribute($password)
    {
        if ($password != '') {
            $this->attributes['password'] = bcrypt($password);
        }
    }

    /**
     * @return array
     */
	 // build array of field specifications
    function getFieldSpec()
    {
        $this->fieldspec['id'] = [
            'type'     => 'integer',
            'minvalue' => 0,
            'pkey'     => 1,
            'required' => 1,
            'label'    => 'id',
            'hidden'   => 1,
            'display'  => 0,
        ];
        $this->fieldspec['phone'] = [
            'type'     => 'integer',
            'required' => 0,
            'hidden'   => 0,
            'label'    => '手机号码',
            'display'  => 1,
        ];
        $this->fieldspec['name'] = [
            'type'     => 'string',
            'required' => 1,
            'hidden'   => 0,
            'label'    => '用户名称',
            'display'  => 1,
        ];
        $this->fieldspec['email'] = [
            'type'     => 'string',
            'required' => 1,
            'hidden'   => 0,
            'label'    => '电子邮件',
            'display'  => 1,
        ];
        $this->fieldspec['role'] = [
            'type'          => 'relation',
            'model'         => 'Role',
            'relation_name' => 'roles',
            'foreign_key'   => 'id',
            'label_key'     => 'display_name',
            'required'      => 1,
            'label'         => '角色权限',
            'hidden'        => 0,
            'display'       => 1,
            'multiple'      => 1,
        ];
        $this->fieldspec['gender'] = [
            'type'        => 'select',
            'required'    => 1,
            'hidden'      => 0,
            'label'       => '性别',
            'display'     => 1,
            'select_data' => [
                'M' => '男',
                'F' => '女',
                'N' => '未知'
            ]
        ];
		$this->fieldspec['list_code'] = [
            'type'     => 'string',
            'required' => 0,
            'hidden'   => 0,
            'label'    => '电话',
            'display'  => 1,
        ];
        $this->fieldspec['password'] = [
            'type'     => 'password',
            'required' => 1,
            'hidden'   => 0,
            'label'    => 'Password',
            'display'  => 1,
            'template' => 'password',
            'validation' => 'min:10|confirmed|regex:'.config('maguttiCms.security.password_regex'),
        ];
        $this->fieldspec['is_active'] = [
            'type'     => 'boolean',
            'required' => 0,
            'hidden'   => 0,
            'label'    => trans('admin.label.publish'),
            'display'  => 1
        ];
        return $this->fieldspec;
    }

    /**
     * create a new  user
     *
     * @param array $data
     *
     * @return mixed
     */
    static public function register(array $data)
    {
        $user = static::create([
            'name'=>$data['phone'],
            'password' => $data['password'],
        ]);

        event(new UserRegistered($user));

        return $user;
    }

    /*
    |--------------------------------------------------------------------------
    | NOTIFIABLE OVERRIDE THE SENDPASSWORDRESETNOTIFICATION
    |--------------------------------------------------------------------------
    |
    */
    public function sendPasswordResetNotification($token)
    {
        $this->notify(new UserResetPasswordNotification($token));
    }

    /**
     * This method is used to check whether the user is active or not.
     *
     * @return bool
     */
    public function isActive()
    {
        return $this->is_active == 1;
    }
}
