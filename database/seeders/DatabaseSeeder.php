<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\File; // تم تصحيح الاستيراد هنا
use App\Models\User;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // 1️⃣ تحديد صلاحيات عامة لكل Resource
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

        // 2️⃣ قراءة كل Resources تلقائيًا من مجلد App/Filament/Resources
        $resourcePath = app_path('Filament/Resources');
        $resources = [];
        if (is_dir($resourcePath)) {
            foreach (File::files($resourcePath) as $file) {
                $resources[] = pathinfo($file->getFilename(), PATHINFO_FILENAME);
            }
        }

        // 3️⃣ إنشاء صلاحيات لكل Resource
        foreach ($resources as $resource) {
            $resourceName = strtolower(str_replace('Resource', '', $resource));
            foreach ($resourcePrefixes as $prefix) {
                $permName = "{$prefix}_{$resourceName}";
                Permission::firstOrCreate(['name' => $permName]);
            }
        }

        // 4️⃣ إضافة Pages إضافية يدويًا إذا أردت
        $pages = ['dashboard',]; // ضع أسماء صفحاتك
        foreach ($pages as $page) {
            $pagePerm = "view_{$page}";
            Permission::firstOrCreate(['name' => $pagePerm]);
        }

        // 5️⃣ إنشاء دور Super Admin وربطه بكل الصلاحيات
        $superAdminRole = Role::firstOrCreate(['name' => 'super_admin']);
        $superAdminRole->syncPermissions(Permission::all());

        // 6️⃣ إنشاء مستخدم Super Admin
        $superAdmin = User::firstOrCreate(
            ['email' => 'admin@example.com'],
            [
                'name' => 'Super Admin',
                'password' => Hash::make('password'),
            ]
        );
        $superAdmin->assignRole($superAdminRole);

        $this->command->info('Seeder: Super Admin, Roles & Permissions created dynamically!');
    }
}  