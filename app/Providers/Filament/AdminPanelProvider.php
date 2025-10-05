<?php

namespace App\Providers\Filament;

use Filament\Http\Middleware\Authenticate;
use BezhanSalleh\FilamentShield\FilamentShieldPlugin;
use Filament\Http\Middleware\AuthenticateSession;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Pages;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Filament\Widgets;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\View\Middleware\ShareErrorsFromSession;
use App\Filament\Pages\Dashboard;
use Filament\Navigation\NavigationGroup; // ✅ أضف هذا السطر إذا لم يكن موجود

class AdminPanelProvider extends PanelProvider
{
    public function panel(Panel $panel): Panel
    {
        return $panel
            ->default()
            ->id('admin')
            ->path('admin')
            ->authGuard('web') // ✅ هذا السطر هو المفتاح لحل مشكلة 403
            // ->brandLogo(asset('logo.png'))
            // ->brandLogoHeight('30px')
            ->brandName('مكتب المحاماة')
            ->login()
            ->colors([
                'primary' => Color::Amber,
            ])
            ->discoverResources(in: app_path('Filament/Resources'), for: 'App\\Filament\\Resources')
            ->discoverPages(in: app_path('Filament/Pages'), for: 'App\\Filament\\Pages')
            ->pages([
                Dashboard::class,
            ])
            ->discoverWidgets(in: app_path('Filament/Widgets'), for: 'App\\Filament\\Widgets')
            ->widgets([
                // Widgets\AccountWidget::class,
                // Widgets\FilamentInfoWidget::class,
            ])
            // ->databaseNotifications()
            // ->databaseNotificationsPolling('30s') 
            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                VerifyCsrfToken::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
            ])
            ->plugins([
                FilamentShieldPlugin::make(),
            ])
            ->authMiddleware([
               // Authenticate::class,
            ]);
    }

    public function navigationGroups(): array
    {
        return [
            NavigationGroup::make()->label('لوحة التحكم'),
            NavigationGroup::make()->label('العملاء والتوكيلات'),
            NavigationGroup::make()->label('القضايا والمحاكم'),
            NavigationGroup::make()->label('المحامين'),
            NavigationGroup::make()->label('الجلسات والمهام'),
            NavigationGroup::make()->label('المستندات والتقارير'),
            NavigationGroup::make()->label('المالية'),
            NavigationGroup::make()->label('الذكاء الاصطناعي'),
            NavigationGroup::make()->label('إدارة المستخدمين'),
            NavigationGroup::make()->label('إدارة الوصول'),
        ];
    }
}
