<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name' => 'ZuperAdmin',
            'email' => 'administrator@ridhuwan.test',
            'role' => 'superadmin',
            'password' => bcrypt('admin123'),
        ]);

        DB::table('users')->insert([
            'name' => 'Wawan',
            'email' => 'iwan@web.com',
            'role' => 'admin',
            'password' => bcrypt('admin123'),
        ]);
    }
}
