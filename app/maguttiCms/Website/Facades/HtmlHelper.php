<?php
/**
 * Created by PhpStorm.
 * User: n0impossible
 * Date: 6/14/15
 * Time: 1:47 PM
 */

namespace App\maguttiCms\Website\Facades;
use Illuminate\Support\Facades\Facade;

class HtmlHelper extends Facade{
    protected static function getFacadeAccessor() { return 'HtmlHelper'; }
}
