<?php

namespace App\Filament\Resources;

use App\Filament\Resources\LegalcaseResource\Pages;
use App\Models\Legalcase;
use Filament\Forms;
use Filament\Tables;
use Filament\Resources\Resource;
use Illuminate\Database\Eloquent\Builder;

class LegalcaseResource extends Resource
{
    protected static ?string $model = Legalcase::class;

    protected static ?string $navigationIcon = 'heroicon-o-scale';
    protected static ?string $navigationLabel = 'القضايا';
    protected static ?string $pluralLabel = 'القضايا';
    protected static ?string $modelLabel = 'قضية';
  
    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()
            ->with(['client', 'lawyer', 'court']);
    }

    public static function form(Forms\Form $form): Forms\Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('case_number')
                    ->label('رقم القضية')
                    ->required()
                    ->maxLength(100),

                Forms\Components\TextInput::make('title')
                    ->label('الموضوع')
                    ->maxLength(200),

                Forms\Components\Select::make('client_id')
                    ->label('العميل')
                    ->relationship('client', 'name')
                    ->searchable()
                    ->required(),

                Forms\Components\Select::make('lawyer_id')
                    ->label('المحامي')
                    ->relationship('lawyer', 'name')
                    ->searchable()
                    ->required(),

                Forms\Components\Select::make('court_id')
                    ->label('المحكمة')
                    ->relationship('court', 'name')
                    ->searchable()
                    ->required(),

                Forms\Components\Select::make('client_role')
                    ->label('صفة العميل')
                    ->options([
                        'مدعي' => 'مدعي',
                        'مدعى عليه' => 'مدعى عليه',
                        'مستأنف' => 'مستأنف',
                        'مستأنف ضده' => 'مستأنف ضده',
                        'طاعن' => 'طاعن',
                        'مجنى عليه' => 'مجنى عليه',
                        'مستشكل' => 'مستشكل',
                        'متظلم ضده' => 'متظلم ضده',
                        'مقدم طلب الرد' => 'مقدم طلب الرد',
                    ])
                    ->nullable(),

                Forms\Components\Select::make('category')
                    ->label('التصنيف')
                    ->options([
                        'جنائي' => 'جنائي',
                        'مدني' => 'مدني',
                        'تجاري' => 'تجاري',
                        'أحوال شخصية' => 'أحوال شخصية',
                        'عمالي' => 'عمالي',
                        'أخرى' => 'أخرى',
                    ])
                    ->nullable(),

                Forms\Components\Select::make('status')
                    ->label('الحالة')
                    ->options([
                        'قيد النظر' => 'قيد النظر',
                        'منتهية بحكم' => 'منتهية بحكم',
                        'معلقة' => 'معلقة',
                        'مؤجلة' => 'مؤجلة',
                        'مغلقة' => 'مغلقة',
                        'منتهية بصلح' => 'منتهية بصلح',
                        'منتهية بتنازل' => 'منتهية بتنازل',
                        'متوقفة' => 'متوقفة',
                    ])
                    ->default('قيد النظر'),

                Forms\Components\DatePicker::make('received_at')
                    ->label('تاريخ الاستلام'),

                Forms\Components\DatePicker::make('ended_at')
                    ->label('تاريخ الانتهاء'),

                Forms\Components\TextInput::make('office_file_no')
                    ->label('رقم ملف المكتب')
                    ->maxLength(100),

                Forms\Components\Textarea::make('note')
                    ->label('ملاحظات')
                    ->rows(4),
            ]);
    }

    public static function table(Tables\Table $table): Tables\Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('case_number')
                    ->label('رقم القضية')
                    ->sortable()
                    ->searchable(),

                Tables\Columns\TextColumn::make('title')
                    ->label('الموضوع')
                    ->limit(30)
                    ->searchable(),

                Tables\Columns\TextColumn::make('client.name')
                    ->label('العميل')
                    ->sortable()
                    ->searchable(),

                Tables\Columns\TextColumn::make('lawyer.name')
                    ->label('المحامي')
                    ->sortable()
                    ->searchable(),

                Tables\Columns\TextColumn::make('court.name')
                    ->label('المحكمة')
                    ->sortable()
                    ->searchable(),

                Tables\Columns\TextColumn::make('client_role')
                    ->label('صفة العميل'),

                Tables\Columns\TextColumn::make('category')
                    ->label('التصنيف'),

                Tables\Columns\TextColumn::make('status')
                    ->label('الحالة')
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'قيد النظر' => 'warning',
                        'منتهية بحكم' => 'danger',
                        'معلقة' => 'gray',
                        'مؤجلة' => 'gray',
                        'مغلقة' => 'secondary',
                        'منتهية بصلح' => 'success',
                        'منتهية بتنازل' => 'success',
                        'متوقفة' => 'gray',
                        default => 'secondary',
                    }),

                Tables\Columns\TextColumn::make('received_at')
                    ->label('تاريخ الاستلام')
                    ->date(),

                Tables\Columns\TextColumn::make('ended_at')
                    ->label('تاريخ الانتهاء')
                    ->date(),

                Tables\Columns\TextColumn::make('office_file_no')
                    ->label('رقم ملف المكتب')
                    ->sortable(),

                Tables\Columns\TextColumn::make('note')
                    ->label('ملاحظات')
                    ->limit(30),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('status')
                    ->label('الحالة')
                    ->options([
                        'قيد النظر' => 'قيد النظر',
                        'منتهية بحكم' => 'منتهية بحكم',
                        'معلقة' => 'معلقة',
                        'مؤجلة' => 'مؤجلة',
                        'مغلقة' => 'مغلقة',
                        'منتهية بصلح' => 'منتهية بصلح',
                        'منتهية بتنازل' => 'منتهية بتنازل',
                        'متوقفة' => 'متوقفة',
                    ]),
                Tables\Filters\SelectFilter::make('category')
                    ->label('التصنيف')
                    ->options([
                        'جنائي' => 'جنائي',
                        'مدني' => 'مدني',
                        'تجاري' => 'تجاري',
                        'أحوال شخصية' => 'أحوال شخصية',
                        'عمالي' => 'عمالي',
                        'أخرى' => 'أخرى',
                    ]),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }


    public static function getPages(): array
    {
        return [
            'index' => Pages\ListLegalcases::route('/'),
            'create' => Pages\CreateLegalcase::route('/create'),
            'edit' => Pages\EditLegalcase::route('/{record}/edit'),
        ];
    }

    public static function getNavigationGroup(): ?string
    {
        return 'القضايا والمحاكم';
    }

    public static function getNavigationSort(): ?int
    {
        return 1;
    }
}
