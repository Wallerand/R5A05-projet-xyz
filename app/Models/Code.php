<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Code extends Model
{
    use HasFactory;

    /** Disable updated_at */
    const UPDATED_AT = null;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['code'];

    /**
     * Indicate the code's host.
     */
    public function host(): BelongsTo
    {
        return $this->belongsTo(User::class, 'host_id');
    }

    /**
     * Indicate the code's guest.
     */
    public function guest(): BelongsTo
    {
        return $this->belongsTo(User::class, 'guest_id');
    }

    /**
     * Determine if given code is consumed.
     */
    public function isConsumed(): bool
    {
        return ! is_null($this->consumed_at);
    }

    /**
     * Scope query to only include remaining codes.
     */
    public function scopeRemaining(Builder $query): Builder
    {
        return $query->whereNull('consumed_at');
    }
}
