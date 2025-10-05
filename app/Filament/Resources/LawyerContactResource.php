<?php

namespace App\Filament\Resources;

use App\Filament\Resources\LawyerContactResource\Pages;
use App\Models\LawyerContact;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class LawyerContactResource extends Resource
{
    protected static ?string $model = LawyerContact::class;

    protected static ?string $navigationIcon = 'heroicon-o-phone'; 
    protected static ?string $navigationLabel = 'وسائل التواصل';
    protected static ?string $pluralLabel = 'وسائل التواصل';
    protected static ?string $modelLabel = 'وسيلة تواصل';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                // اختيار المحامي
                Forms\Components\Select::make('lawyer_id')
                    ->relationship('lawyer', 'name') // يفترض أن جدول المحامين فيه عمود name
                    ->label('المحامي')
                    ->required(),

                // نوع التواصل
                Forms\Components\Select::make('type')
                    ->options([
                        'phone' => 'هاتف',
                        'email' => 'بريد إلكتروني',
                        'address' => 'عنوان',
                    ])
                    ->label('نوع التواصل')
                    ->required(),

                // القيمة
                Forms\Components\TextInput::make('value')
                    ->label('القيمة')
                    ->required()
                    ->maxLength(255),
            ]);
    }
    
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')->sortable(),
                Tables\Columns\TextColumn::make('lawyer.name')->label('المحامي')->sortable()->searchable(),
                Tables\Columns\TextColumn::make('type')->label('النوع')->sortable(),
                Tables\Columns\TextColumn::make('value')->label('القيمة')->searchable(),
                Tables\Columns\TextColumn::make('created_at')->label('تاريخ الإنشاء')->dateTime('d-m-Y H:i'),
            ])
            ->filters([
                // فلترة حسب النوع
                Tables\Filters\SelectFilter::make('type')
                    ->options([
                        'phone' => 'هاتف',
                        'email' => 'بريد إلكتروني',
                        'address' => 'عنوان',
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
            'index' => Pages\ListLawyerContacts::route('/'),
            'create' => Pages\CreateLawyerContact::route('/create'),
            'edit' => Pages\EditLawyerContact::route('/{record}/edit'),
        ];
    }
    public static function getNavigationGroup(): ?string
    {
        return 'المحامين';
    }

    public static function getNavigationSort(): ?int
    {
        return 3;
    }
}
