<?php

namespace App\Exceptions;

use RuntimeException;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;

class RegistrationFailedException extends RuntimeException
{
    /**
     * Render the exception into an HTTP response.
     */
    public function render(Request $request): RedirectResponse
    {
        return back()
            ->withErrors(['email' => trans('auth.registration_failed')])
            ->onlyInput('email');
    }
}
