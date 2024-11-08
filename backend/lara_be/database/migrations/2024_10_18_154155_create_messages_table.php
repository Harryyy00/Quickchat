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
        Schema::create('messages', function (Blueprint $table) {
            $table->id();
            $table->uuid('conversation_id'); // This should be UUID instead of foreignId
            $table->string('sender'); // the username of the sender
            $table->string('recipient'); // the username of the recipient
            $table->text('content'); // message content
            $table->timestamp('sent_at'); // time when the message was sent
            $table->timestamps(); // created_at and updated_at timestamps

            // Add foreign key constraint to conversation_id based on the UUID in conversations
            $table->foreign('conversation_id')->references('conversation_id')->on('conversations')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('messages');
    }
};
