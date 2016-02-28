<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCategoriesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('categories', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('slug');
			$table->string('image')->nullable();
			$table->integer('parent_id')->nullable()->default(0);
			$table->integer('status');
			$table->integer('order');
			$table->timestamps();
		});

		Schema::create('category_translations', function (Blueprint $table) {
			$table->increments('id');
			$table->integer('category_id')->unsigned();

			$table->string('title');
			$table->text('description')->nullable();
			$table->string('seo_title')->nullable();
			$table->string('seo_description')->nullable();
			$table->string('seo_keywords')->nullable();

			$table->string('locale')->index();
			$table->unique(['category_id','locale']);
			$table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('categories');
	}

}
