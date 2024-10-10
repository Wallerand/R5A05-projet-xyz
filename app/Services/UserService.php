<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;

class UserService
{
    /** Currently logged user */
    protected User $user;

    /**
     * @see app/Providers/AppServiceProvider.php
     */
    public function __construct(User $user)
    {
        $this->user = $user;
    }

    /**
     * Get user's tracks count for the given $week.
     */
    public function getTracksCount(): int
    {
        return $this->user->current_tracks_count;
    }

    /**
     * Get remaining track count for logged user.
     */
    public function remainingTracksCount(): int
    {
        $limit = config('app.tracks_per_week');

        return max(0, $limit - $this->user->current_tracks_count);
    }

    /**
     * Delete current avatar (if exists) and store the new one.
     */
    public function setAvatar(UploadedFile $avatar): string
    {
        // Remove current avatar if exists
        if (is_string($this->user->avatar)) {
            Storage::disk('public')->delete($this->user->avatar);
        }

        // Set new avatar
        return $avatar->store('avatars', ['disk' => 'public']);
    }
}
