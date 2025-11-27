// <?php

// namespace Database\Seeders;

// use App\Models\User;
// // use Illuminate\Database\Console\Seeds\WithoutModelEvents;
// use Illuminate\Database\Seeder;
// use Illuminate\Support\Facades\Hash; // تحتاج هذا لإستخدام Hash::make

// class DatabaseSeeder extends Seeder
// {
//     /**
//      * Seed the application's database.
//      */
//     public function run(): void
//     {
//         // User::factory(10)->create();

//         User::factory()->create([
//             'name' => 'Test User',
//             'email' => 'test@example.com',
//             'password' => Hash::make('password'), // كلمة المرور هنا
//         ]);
//     }
// }
<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role; // <-- مهم جداً

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // 1. أنشئ الدور الذي يبحث عنه filament-shield
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
