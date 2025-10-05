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
        Schema::create('transactions', function (Blueprint $table) {
             $table->id();

    // account_id → جدول accounts
    $table->unsignedBigInteger('account_id')->index();
    $table->foreign('account_id', 'transactions_account_id_foreign')
          ->references('id')->on('accounts')
          ->onDelete('cascade');

    // client_id → جدول clients
    $table->unsignedBigInteger('client_id')->nullable()->index();
    $table->foreign('client_id', 'transactions_client_id_foreign')
          ->references('id')->on('clients')
          ->onDelete('cascade');

    // lawyer_id → جدول lawyers
    $table->unsignedBigInteger('lawyer_id')->nullable()->index();
    $table->foreign('lawyer_id', 'transactions_lawyer_id_foreign')
          ->references('id')->on('lawyers')
          ->onDelete('cascade');

    // case_id → جدول legal_cases
    $table->unsignedBigInteger('case_id')->nullable()->index();
    $table->foreign('case_id', 'transactions_case_id_foreign')
          ->references('id')->on('legal_case') // ⚠ تأكد أن اسم الجدول legal_case مش legal_cases
          ->onDelete('cascade');

    // transaction_category_id → جدول transaction_categories
    $table->unsignedBigInteger('transaction_category_id')->index();
    $table->foreign('transaction_category_id', 'transactions_transaction_category_id_foreign')
          ->references('id')->on('transaction_categories')
          ->onDelete('cascade');

    $table->decimal('amount', 12, 2);
    $table->enum('txn_type', ['دفعة مقدمة', 'دفعة نهائية', 'رسوم', 'أخرى'])->index();
    $table->dateTime('txn_date')->index();
    $table->text('notes')->nullable();
    $table->timestamps();

    // فهارس مركبة للأداء عند البحث
    $table->index(['account_id', 'txn_date']);
    $table->index(['client_id', 'txn_date']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transactions');
    }
};
