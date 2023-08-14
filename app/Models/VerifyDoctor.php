<?php

namespace App\Models;

use App\Models\Doctor;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class VerifyDoctor extends Model
{
    use HasFactory;

    public $table = 'verify_doctors';

    protected $fillable = [

        'doctor_id',
        'token',
    ];

    public function doctor(){
        return $this->belongsTo(Doctor::class);
    }
}
