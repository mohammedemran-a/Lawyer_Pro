<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // إنشاء مستخدم super admin يدويًا
        $admin = User::updateOrCreate(
            ['email' => 'admin@example.com'], // البحث بالبريد
            [
                'name' => 'Super Admin',
                'password' => Hash::make('password'),
            ]
        );

        // التأكد من وجود الدور في حال تم تثبيت Shield أو Spatie Permission
        $role = Role::firstOrCreate(['name' => 'super_admin', 'guard_name' => 'web']);

        // ربط الدور بالمستخدم
        $admin->assignRole($role);

        $this->command->info('✅ Super Admin created: admin@example.com / password');
    }
}
