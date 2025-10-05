

<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\LogalAssistantBotController;


Route::prefix('logal-assistant-bots')->group(function () {
    Route::get('/', [LogalAssistantBotController::class, 'index']);      // عرض كل السجلات
    Route::post('/', [LogalAssistantBotController::class, 'store']);     // إضافة سجل جديد
    Route::get('/{id}', [LogalAssistantBotController::class, 'show']);   // عرض سجل واحد
    Route::put('/{id}', [LogalAssistantBotController::class, 'update']); // تعديل سجل
    Route::delete('/{id}', [LogalAssistantBotController::class, 'destroy']); // حذف سجل
});

