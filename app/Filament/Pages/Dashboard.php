<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Filament\Widgets\CasesStats;
use App\Filament\Widgets\CasesTable;

class Dashboard extends Page
{
    protected static ?string $navigationIcon = 'heroicon-o-home';

    protected static string $view = 'filament.pages.dashboard';

    protected static ?string $navigationLabel = 'لوحة تحكم';

    protected static ?string $title = 'لوحة تحكم';

    protected function getWidgets(): array
    {
        return [
            CasesStats::class,
            CasesTable::class,
        ];
    }

    // 🔑 هنا التحقق من الصلاحية
    public static function canAccess(): bool
    {
        return auth()->user()?->can('page_Dashboard');
    }
           public static function getNavigationGroup(): ?string
{
    return 'لوحة التحكم '; // حسب المجموعة
}

public static function getNavigationSort(): ?int
{
    return 1; // حسب الترتيب داخل المجموعة
}
}

