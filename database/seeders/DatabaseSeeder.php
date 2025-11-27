<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // 1. أنشئ دور المدير الخارق الذي يبحث عنه filament-shield
        $role = Role::firstOrCreate(['name' => 'super_admin']);

        // 2. أنشئ المستخدم المدير
        $user = User::firstOrCreate(
            ['email' => 'test@example.com'],
            [
                'name' => 'Admin User',
                'password' => Hash::make('password'),
            ]
        );

        // 3. أعطِ المستخدم الدور الذي أنشأناه
        $user->assignRole($role);
    }
}
