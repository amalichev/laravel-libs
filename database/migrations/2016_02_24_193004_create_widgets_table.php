<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWidgetsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('widgets', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('slug');
			$table->timestamps();
		});

		Schema::create('widget_translations', function (Blueprint $table) {
			$table->increments('id');
			$table->integer('widget_id')->unsigned();

			$table->string('title');

			$table->string('locale')->index();
			$table->unique(['widget_id','locale']);
			$table->foreign('widget_id')->references('id')->on('widgets')->onDelete('cascade');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('widgets');
		Schema::drop('widget_translations');
	}

}
