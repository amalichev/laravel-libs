<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReviewsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('reviews', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('image')->nullable();
			$table->integer('order');
			$table->timestamps();
		});

		Schema::create('review_translations', function (Blueprint $table) {
			$table->increments('id');
			$table->integer('review_id')->unsigned();

			$table->string('title');
			$table->string('position')->nullable();
			$table->text('teaser');
			$table->text('text');

			$table->string('locale')->index();
			$table->unique(['review_id','locale']);
			$table->foreign('review_id')->references('id')->on('reviews')->onDelete('cascade');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('reviews');
		Schema::drop('review_translations');
	}

}
