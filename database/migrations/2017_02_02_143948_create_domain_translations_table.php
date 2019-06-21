<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

/**
 * Migration auto-generated by Sequel Pro Laravel Export
 * @see https://github.com/cviebrock/sequel-pro-laravel-export
 */
class CreateDomainTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('domain_translations', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('domain_id');
            $table->string('locale', 255);
            $table->string('title', 255);
            $table->nullableTimestamps();
            $table->unique(['domain_id', 'locale'], 'domains_translations_domain_id_locale_unique');
            $table->index('locale', 'domains_translations_locale_index');
            $table->foreign('domain_id', 'domains_translations_domain_id_foreign')->references('id')->on('domains')->onDelete('CASCADE
')->onUpdate('RESTRICT');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('domain_translations');
    }
}
