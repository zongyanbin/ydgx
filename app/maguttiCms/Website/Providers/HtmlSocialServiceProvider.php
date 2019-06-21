<?php

namespace App\maguttiCms\Website\Providers;
Use App;
use Illuminate\Support\ServiceProvider;

class HtmlSocialServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        //

    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        App::bind('HtmlSocial', function()
        {
            return new \App\maguttiCms\Website\Decorator\HtmlSocial;
        });
    }
}
