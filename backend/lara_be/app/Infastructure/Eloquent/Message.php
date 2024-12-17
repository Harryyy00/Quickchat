<?php
namespace App\Infastructure\Eloquent;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Message extends Model
{
    use HasFactory;

    protected $fillable = [
        'conversation_id',
        'sender',
        'recipient',
        'content',
        'sent_at',
    ];

    protected $casts = [
        'sent_at' => 'datetime',
    ];

    public function conversation()
    {
        return $this->belongsTo(Conversation::class, 'conversation_id', 'conversation_id');
    }
}