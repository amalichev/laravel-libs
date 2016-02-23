<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class RemoveFieldsMarkersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('markers', function(Blueprint $table)
		{
			$table->dropColumn('x_coord');
			$table->dropColumn('y_coord');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('markers', function(Blueprint $table)
		{
			$table->integer('x_coord')->nullable()->default(0)->after('uri');
			$table->integer('y_coord')->nullable()->default(0)->after('x_coord');
		});
	}

}
