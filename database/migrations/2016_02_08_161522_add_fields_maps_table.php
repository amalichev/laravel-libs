<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddFieldsMapsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('maps', function(Blueprint $table)
		{
			$table->string('width')->after('style');
			$table->string('height')->after('width');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('maps', function(Blueprint $table)
		{
			$table->dropColumn('width');
			$table->dropColumn('height');
		});
	}

}
