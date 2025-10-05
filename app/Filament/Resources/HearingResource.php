<?php

namespace App\Filament\Resources;

use App\Filament\Resources\HearingResource\Pages;
use App\Models\Hearing;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;

use pxlrbt\FilamentExcel\Actions\Tables\ExportAction;

class HearingResource extends Resource
{
    protected static ?string $model = Hearing::class;

    protected static ?string $navigationIcon  = 'heroicon-o-calendar-days';
    protected static ?string $navigationLabel = 'الجلسات';
    protected static ?string $pluralLabel     = 'الجلسات';
    protected static ?string $label           = 'جلسة';

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()
            ->with(['case', 'court', 'lawyer', 'client']);
    }

    public static function form(Form $form): Form
    {
        return $form->schema([
            Forms\Components\Select::make('case_id')
                ->label('القضية')
                ->relationship('case', 'title')
                ->searchable()
                ->required(),
            Forms\Components\Select::make('court_id')
                ->label('المحكمة')
                ->relationship('court', 'name')
                ->searchable()
                ->required(),
            Forms\Components\Select::make('lawyer_id')
                ->label('المحامي')
                ->relationship('lawyer', 'name')
                ->searchable(),
            Forms\Components\Select::make('client_id')
                ->label('العميل')
                ->relationship('client', 'name')
                ->searchable(),
            Forms\Components\DateTimePicker::make('hearing_datetime')
                ->label('تاريخ ووقت الجلسة')
                ->required(),
            Forms\Components\TextInput::make('topic')->label('موضوع الجلسة')->maxLength(200),
            Forms\Components\Textarea::make('decision')->label('القرار'),
            Forms\Components\Textarea::make('required_action')->label('الإجراء المطلوب'),
            Forms\Components\DatePicker::make('postponed_to')->label('تأجيل إلى'),
            Forms\Components\TextInput::make('conter')->label('العداد')->numeric(),
            Forms\Components\Textarea::make('notes')->label('ملاحظات'),
            Forms\Components\Select::make('session_type')
                ->label('نوع الجلسة')
                ->options([
                    'urgent'    => 'مستعجلة',
                    'normal'    => 'عادية',
                    'follow-up' => 'متابعة',
                ]),
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('case.title')->label('القضية')->sortable()->searchable(),
                Tables\Columns\TextColumn::make('court.name')->label('المحكمة')->sortable()->searchable(),
                Tables\Columns\TextColumn::make('lawyer.name')->label('المحامي'),
                Tables\Columns\TextColumn::make('client.name')->label('العميل'),
                Tables\Columns\TextColumn::make('hearing_datetime')->label('تاريخ الجلسة')->dateTime('d/m/Y H:i'),
                Tables\Columns\TextColumn::make('topic')->label('الموضوع')->limit(30),
                Tables\Columns\TextColumn::make('decision')->label('القرار')->limit(30),
                Tables\Columns\TextColumn::make('postponed_to')->label('مؤجلة إلى')->date(),
                Tables\Columns\TextColumn::make('calendar_tag')->label('وسم'),
            ])
            ->filters([
                Tables\Filters\Filter::make('postponed')
                    ->label('مؤجلة')
                    ->query(fn ($query) => $query->whereNotNull('postponed_to')),

                Tables\Filters\Filter::make('date')
                    ->label('حسب التاريخ')
                    ->form([Forms\Components\DatePicker::make('date')->label('اختر يوم')])
                    ->query(function (Builder $query, array $data) {
                        if (!empty($data['date'])) {
                            $query->whereDate('hearing_datetime', $data['date']);
                        }
                    }),
            ])
            ->headerActions([
                Tables\Actions\Action::make('calendar')
                    ->label('عرض حسب اليوم')
                    ->icon('heroicon-o-calendar')
                    ->form([Forms\Components\DatePicker::make('date')->label('اختر يوم')->required()])
                    ->action(function (array $data, $livewire) {
                        $livewire->redirect(
                            HearingResource::getUrl('index', ['tableFilters[date][date]' => $data['date']])
                        );
                    }),

                ExportAction::make()->label('تصدير'),
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

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index'  => Pages\ListHearings::route('/'),
            'create' => Pages\CreateHearing::route('/create'),
            'edit'   => Pages\EditHearing::route('/{record}/edit'),
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
