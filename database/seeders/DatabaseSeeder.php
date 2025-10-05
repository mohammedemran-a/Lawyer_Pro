<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\File;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // 1️⃣ الأفعال العامة لكل Resource
        $resourcePrefixes = [
            'view',
            'view_any',
            'create',
            'update',
            'restore',
            'restore_any',
            'replicate',
            'reorder',
            'delete',
            'delete_any',
            'force_delete',
            'force_delete_any',
        ];

        /*
        |--------------------------------------------------------------------------
        | 🧩 إنشاء صلاحيات Resources (بما في ذلك المجلدات الفرعية)
        |--------------------------------------------------------------------------
        */
        $resourcePath = app_path('Filament/Resources');
        if (is_dir($resourcePath)) {
            foreach (File::allFiles($resourcePath) as $file) {
                $fileName = pathinfo($file->getFilename(), PATHINFO_FILENAME);
                $resourceName = strtolower(str_replace('Resource', '', $fileName));

                foreach ($resourcePrefixes as $prefix) {
                    $permName = "{$prefix}_{$resourceName}";
                    Permission::firstOrCreate(['name' => $permName]);
                }
            }
        }

        /*
        |--------------------------------------------------------------------------
        | 📄 إنشاء صلاحيات Pages (بما في ذلك المجلدات الفرعية)
        |--------------------------------------------------------------------------
        */
        $pagePath = app_path('Filament/Pages');
        if (is_dir($pagePath)) {
            foreach (File::allFiles($pagePath) as $file) {
                $pageName = strtolower(pathinfo($file->getFilename(), PATHINFO_FILENAME));
                Permission::firstOrCreate(['name' => "view_{$pageName}"]);
            }
        }

        /*
        |--------------------------------------------------------------------------
        | 🧱 إنشاء صلاحيات Widgets (بما في ذلك المجلدات الفرعية)
        |--------------------------------------------------------------------------
        */
        $widgetPath = app_path('Filament/Widgets');
        if (is_dir($widgetPath)) {
            foreach (File::allFiles($widgetPath) as $file) {
                $widgetName = strtolower(pathinfo($file->getFilename(), PATHINFO_FILENAME));
                Permission::firstOrCreate(['name' => "view_{$widgetName}"]);
            }
        }

        /*
        |--------------------------------------------------------------------------
        | 👑 إنشاء دور Super Admin وربطه بكل الصلاحيات
        |--------------------------------------------------------------------------
        */
        $superAdminRole = Role::firstOrCreate(['name' => 'super_admin']);
        $superAdminRole->syncPermissions(Permission::all());

        /*
        |--------------------------------------------------------------------------
        | 👤 إنشاء مستخدم Super Admin باستخدام Factory
        |--------------------------------------------------------------------------
        */
        $superAdmin = User::factory()->create([
            'name' => 'Super Admin',
            'email' => 'admin@example.com',
            'password' => Hash::make('password'),
        ]);

        $superAdmin->assignRole($superAdminRole);

        $this->command->info('✅ تم إنشاء الصلاحيات والأدوار والمستخدم Super Admin بنجاح مع دعم المجلدات الفرعية!');
    }
}
