<?php

namespace App\Http\Controllers;

use App\Models\Code;
use App\Models\User;
use App\Mail\WelcomeMessage;
use App\Services\CodeService;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Exceptions\RegistrationFailedException;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;

class RegisterController extends Controller
{
    /**
     * Terms form.
     */
    public function terms(Request $request): View
    {
        $request->validate([
            'code' => [Rule::exists('codes', 'code')->whereNull('consumed_at')]
        ]);

        $code = Code::with('host')->where('code', $request->code)->first();

        return view('auth.signup-terms', [
            'user' => $code->host,
            'code' => $request->code,
        ]);
    }

    /**
     * Account form.
     */
    public function account(Request $request): View
    {
        $request->validate([
            'terms' => 'accepted',
            'code' => [Rule::exists('codes', 'code')->whereNull('consumed_at')]
        ]);

        $code = Code::with('host')->where('code', $request->code)->first();

        return view('auth.signup-account', [
            'user' => $code->host,
            'code' => $request->code,
        ]);
    }

    /**
     * Handle account form.
     *
     * @throws RegistrationFailedException
     */
    public function register(Request $request, CodeService $service): RedirectResponse
    {
        $request->validate([
            'email' => ['required', 'email', 'max:255', Rule::unique('users', 'email')],
            'password' => ['required', 'min:4', 'max:255'],
            'code' => [Rule::exists('codes', 'code')->whereNull('consumed_at')]
        ]);

        DB::beginTransaction();

        try {
            // Create user
            $user = new User($request->only(['email', 'password']));
            $user->save();

            // Make code as consumed
            $service->markAsConsumed($request->string('code'), $user);

            // Generate user codes
            $codes = $service->generate(config('app.codes_count'));
            $user->codes()->saveMany($codes);

            // Send welcome e-mail
            Mail::to($user)->send(new WelcomeMessage($user->codes));

            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();

            // Rendering of this custom exception is defined within the exception itself
            throw new RegistrationFailedException(previous: $th);
        }

        Auth::loginUsingId($user->id);

        // Generate a new session identifier
        $request->session()->regenerate();

        return redirect()->route('home');
    }
}
