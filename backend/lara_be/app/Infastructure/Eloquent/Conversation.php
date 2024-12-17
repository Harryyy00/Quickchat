<?php
namespace App\Infastructure\Eloquent;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Conversation extends Model
{
    use HasFactory;

    protected $fillable = [
        'sender',
        'recipient',
        'last_message_time',
        'last_message',
        'conversation_id',
    ];

    protected $casts = [
        'last_message_time' => 'datetime',
    ];
}