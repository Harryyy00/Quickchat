<?php
namespace App\Infastructure\Eloquent;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $fillable = ['name', 'userName', 'password', 'profilePictureBlob'];
}