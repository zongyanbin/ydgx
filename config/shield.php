<?php

/*
 * This file is part of Laravel Shield.
 *
 * (c) Vincent Klaiber <hello@vinkla.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

declare(strict_types=1);

return [

    /*
    |--------------------------------------------------------------------------
    | HTTP Basic Auth Credentials
    |--------------------------------------------------------------------------
    |
    | The user credentials which are used when logging in with HTTP basic
    | authentication.
    |
    */

    'users' => [
        'main' => [
            password_hash('username', PASSWORD_BCRYPT), 	// config this
            password_hash('setup', PASSWORD_BCRYPT),
        ],
    ],

];
