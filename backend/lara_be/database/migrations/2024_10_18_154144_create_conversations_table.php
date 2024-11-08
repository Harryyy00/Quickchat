<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('conversations', function (Blueprint $table) {
            $table->id();
            $table->string('sender'); // the username of the sender
            $table->string('recipient'); // the username of the recipient
            $table->timestamp('last_message_time')->nullable(); // timestamp of the last message
            $table->string('last_message')->nullable(); // content of the last message
            $table->uuid('conversation_id')->unique(); // automatically generate a UUID for conversation_id
            $table->timestamps(); // created_at and updated_at timestamps
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('conversations');
    }
};
