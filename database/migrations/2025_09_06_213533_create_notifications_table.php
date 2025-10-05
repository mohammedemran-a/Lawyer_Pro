<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('notifications', function (Blueprint $table) {
                $table->id();

    // user_id → جدول users
    $table->unsignedBigInteger('user_id')->index();
    $table->foreign('user_id', 'notifications_user_id_foreign')
          ->references('id')
          ->on('users')
          ->cascadeOnDelete();

    $table->string('record_table', 100)->nullable()->index();
    $table->integer('record_id')->nullable()->index();
    $table->text('message');
    $table->boolean('is_read')->default(false)->index();
    $table->timestamps();

    $table->index(['user_id', 'is_read']);

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('notifications');
    }
};
