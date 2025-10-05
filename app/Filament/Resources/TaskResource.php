<?php

namespace App\Filament\Resources;

use App\Filament\Resources\TaskResource\Pages;
use App\Models\Task;
use Filament\Forms;
use Filament\Resources\Resource;
use Filament\Tables;

class TaskResource extends Resource
{
    protected static ?string $model = Task::class;

    protected static ?string $navigationIcon = 'heroicon-o-clipboard-document-check';
    protected static ?string $modelLabel = 'مهمة';
    protected static ?string $pluralModelLabel = 'المهام';
    protected static ?string $navigationLabel = 'المهام';

    public static function form(Forms\Form $form): Forms\Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('priority')
                    ->label('الأولوية')
                    ->options([
                        '(1) High'   => 'عالية',
                        '(2) Normal' => 'متوسطة',
                        '(3) Low'    => 'منخفضة',
                    ])
                    ->colors([
                        'danger'  => '(1) High',
                        'warning' => '(2) Normal',
                        'success' => '(3) Low',
                    ])
                    ->default('(2) Normal'),

                Forms\Components\Select::make('status')
                    ->label('الحالة')
                    ->options([
                        'Not Started' => 'لم تبدأ',
                        'In Progress' => 'قيد التنفيذ',
                        'Completed'   => 'مكتملة',
                        'Deferred'    => 'مؤجلة',
                        'Waiting'     => 'في الانتظار',
                    ])
                    ->colors([
                        'gray'    => 'Not Started',
                        'warning' => 'In Progress',
                        'success' => 'Completed',
                        'danger'  => 'Deferred',
                        'info'    => 'Waiting',
                    ])
                    ->default('Not Started'),

                Forms\Components\TextInput::make('title')
                    ->label('العنوان')
                    ->required(),

                Forms\Components\Textarea::make('description')
                    ->label('الوصف'),

                Forms\Components\DatePicker::make('due_date')
                    ->label('تاريخ الاستحقاق'),

                Forms\Components\TextInput::make('percent_complete')
                    ->label('نسبة الإنجاز (%)')
                    ->numeric()
                    ->default(0),
            ]);
    }

    public static function table(Tables\Table $table): Tables\Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('title')
                    ->label('العنوان')
                    ->searchable(),

                Tables\Columns\TextColumn::make('priority')
                    ->label('الأولوية')
                    ->badge()
                    ->colors([
                        'danger'  => fn($state) => $state === '(1) High',
                        'warning' => fn($state) => $state === '(2) Normal',
                        'success' => fn($state) => $state === '(3) Low',
                    ])
                    ->formatStateUsing(fn($state) => match($state) {
                        '(1) High'   => 'عالية',
                        '(2) Normal' => 'متوسطة',
                        '(3) Low'    => 'منخفضة',
                        default      => $state,
                    }),

                Tables\Columns\TextColumn::make('status')
                    ->label('الحالة')
                    ->badge()
                    ->colors([
                        'gray'    => 'Not Started',
                        'warning' => 'In Progress',
                        'success' => 'Completed',
                        'danger'  => 'Deferred',
                        'info'    => 'Waiting',
                    ])
                    ->formatStateUsing(fn($state) => match($state) {
                        'Not Started' => 'لم تبدأ',
                        'In Progress' => 'قيد التنفيذ',
                        'Completed'   => 'مكتملة',
                        'Deferred'    => 'مؤجلة',
                        'Waiting'     => 'في الانتظار',
                        default       => $state,
                    }),

                Tables\Columns\TextColumn::make('due_date')
                    ->label('تاريخ الاستحقاق')
                    ->date(),

                Tables\Columns\TextColumn::make('percent_complete')
                    ->label('نسبة الإنجاز (%)'),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListTasks::route('/'),
            'create' => Pages\CreateTask::route('/create'),
            'edit' => Pages\EditTask::route('/{record}/edit'),
        ];
    }

    public static function getNavigationGroup(): ?string
    {
        return 'الجلسات والمهام';
    }

    public static function getNavigationSort(): ?int
    {
        return 1;
    }
}
