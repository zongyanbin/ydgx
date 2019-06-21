<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title');
            $table->integer('user_id')->index();
            $table->text('content');
            $table->timestamps();
        });
    }





    /**
     *2019_05_20_083612_create_comments_table.php
    php artisan migrate --path/database/migrations/2019_05_20_083612_create_comments_table.php
    php artisan migrate --path=/database/migrations/2019_05_20_083612_create_comments_table.php

    php artisan migrate --path=/database/migrations/2019_05_20_083612_create_comments_table.php
     *
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('posts');
    }
}
