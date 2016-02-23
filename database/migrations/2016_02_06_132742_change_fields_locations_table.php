<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ChangeFieldsLocationsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('locations', function(Blueprint $table)
		{
			$table->foreign('marker_id')->references('id')->on('markers');
			$table->foreign('map_id')->references('id')->on('maps');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('locations', function(Blueprint $table)
		{
			$table->foreign('marker_id')->references('id')->on('markers')->onDelete('cascade');
			$table->foreign('map_id')->references('id')->on('maps')->onDelete('cascade');
		});
	}

}
