<?php

namespace App\Filament\Resources;

use App\Filament\Resources\LawyerAttachmentResource\Pages;
use App\Models\LawyerAttachment;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;

class LawyerAttachmentResource extends Resource
{
    protected static ?string $model = LawyerAttachment::class;

    protected static ?string $navigationIcon = 'heroicon-o-paper-clip';
    protected static ?string $navigationLabel = 'المرفقات';
    protected static ?string $pluralLabel = 'المرفقات';
    protected static ?string $modelLabel = 'مرفق';


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                // اختيار المحامي
                Forms\Components\Select::make('lawyer_id')
                    ->relationship('lawyer', 'name')
                    ->label('المحامي')
                    ->required(),

                // اسم الملف
                Forms\Components\TextInput::make('file_name')
                    ->label('اسم الملف')
                    ->required()
                    ->maxLength(255),

                // رفع الملف (اختياري)
                Forms\Components\FileUpload::make('file_path')
                    ->label('المسار (مرفق)')
                    ->directory('lawyer_attachments')
                    ->visibility('public')
                    ->nullable(),

                // نوع المرفق
                Forms\Components\Select::make('category')
                    ->options([
                        'إنابة' => 'إنابة',
                        'بطاقة نقابة' => 'بطاقة نقابة',
                        'هوية' => 'هوية',
                        'اخرى' => 'أخرى',
                    ])
                    ->label('التصنيف')
                    ->required(),

                // مكان التخزين
                Forms\Components\Select::make('storage_type')
                    ->options([
                        'DB' => 'قاعدة البيانات',
                        'Path' => 'مسار (Storage)',
                    ])
                    ->label('طريقة التخزين')
                    ->default('Path')
                    ->required(),

                // رفع ملف بصيغة Blob (إذا أردت تخزينه مباشرة بالـ DB)
                Forms\Components\FileUpload::make('file_blob')
                    ->label('مرفق (DB Blob)')
                    ->nullable()
                    ->enableDownload()
                    ->enableOpen(),

                // وقت الرفع
                Forms\Components\DateTimePicker::make('uploaded_at')
                    ->label('تاريخ الرفع')
                    ->default(now()),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')->sortable(),
                Tables\Columns\TextColumn::make('lawyer.name')->label('المحامي')->sortable()->searchable(),
                Tables\Columns\TextColumn::make('file_name')->label('اسم الملف')->searchable(),
                Tables\Columns\BadgeColumn::make('category')
                    ->label('التصنيف')
                    ->colors([
                        'primary' => 'إنابة',
                        'success' => 'بطاقة نقابة',
                        'warning' => 'هوية',
                        'secondary' => 'اخرى',
                    ]),
                Tables\Columns\TextColumn::make('storage_type')->label('التخزين'),
                Tables\Columns\TextColumn::make('uploaded_at')->label('تاريخ الرفع')->dateTime('d-m-Y H:i'),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('category')
                    ->options([
                        'إنابة' => 'إنابة',
                        'بطاقة نقابة' => 'بطاقة نقابة',
                        'هوية' => 'هوية',
                        'اخرى' => 'أخرى',
                    ]),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListLawyerAttachments::route('/'),
            'create' => Pages\CreateLawyerAttachment::route('/create'),
            'edit' => Pages\EditLawyerAttachment::route('/{record}/edit'),
        ];
    }
    public static function getNavigationGroup(): ?string
    {
        return 'المحامين';
    }

    public static function getNavigationSort(): ?int
    {
        return 2;
    }
}

