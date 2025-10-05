<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\LogalAssistantBot;
use Illuminate\Http\Request;

class LogalAssistantBotController extends Controller
{
    // إرجاع كل السجلات
    public function index()
    {
        return response()->json(LogalAssistantBot::with(['user', 'sourceLaw'])->get());
    }

    // إرجاع سجل واحد
    public function show(LogalAssistantBot $logalAssistantBot)
    {
        return response()->json($logalAssistantBot->load(['user', 'sourceLaw']));
    }

    // إنشاء سجل جديد
    public function store(Request $request)
    {
        $data = $request->validate([
            'user_id' => 'nullable|exists:users,id',
            'question' => 'required|string',
            'response' => 'nullable|string',
            'source_law_id' => 'nullable|exists:laws_documents,id',
        ]);

        $bot = LogalAssistantBot::create($data);

        return response()->json($bot, 201);
    }

    // تحديث سجل
    public function update(Request $request, LogalAssistantBot $logalAssistantBot)
    {
        $data = $request->validate([
            'user_id' => 'nullable|exists:users,id',
            'question' => 'sometimes|required|string',
            'response' => 'nullable|string',
            'source_law_id' => 'nullable|exists:laws_documents,id',
        ]);

        $logalAssistantBot->update($data);

        return response()->json($logalAssistantBot);
    }

    // حذف سجل
    public function destroy(LogalAssistantBot $logalAssistantBot)
    {
        $logalAssistantBot->delete();

        return response()->json(null, 204);
    }
}
