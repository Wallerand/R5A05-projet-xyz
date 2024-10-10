<x-app title="Profil">

    <main class="container-wide two-cols space-y-8">
        <section>
            <h1>
                Profil <small>{{ $user->username }}</small>
            </h1>

            <form method="post" enctype="multipart/form-data" action="{{ route('profile.update') }}" class="profile-form space-y-4">
                <div>
                    <label for="file">Avatar</label>
                    <div class="avatar-input">
                        <x-avatar size="large" :src="$user->avatar" />
                        <div>
                            <input id="file" type="file" name="avatar">
                        </div>
                    </div>
                </div>

                @error('avatar')
                <p class="error-message">{{ $message }}</p>
                @enderror

                <div>
                    <label for="email">Adresse email</label>
                    <input id="email" class="w-large" type="email" name="email" value="{{ $user->email }}" placeholder="email" autocomplete="email">
                </div>

                @error('email')
                <p class="error-message">{{ $message }}</p>
                @enderror

                <div>
                    <label for="password">Mot de passe</label>
                    <input id="password" class="w-medium" type="password" name="password" placeholder="•••••••••••••••">
                </div>

                @error('password')
                <p class="error-message">{{ $message }}</p>
                @enderror
        
                <div>
                    @csrf
                    <button class="primary">Mettre à jour</button>
                </div>

                @session('success')
                <p class="success-message">{{ $value }}</p>
                @endsession
            </form>
        </section>

        <div>
            <div class="block block-content space-y-8">
                
                <div class="title">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                        <path fill-rule="evenodd" d="M9.493 2.852a.75.75 0 0 0-1.486-.204L7.545 6H4.198a.75.75 0 0 0 0 1.5h3.14l-.69 5H3.302a.75.75 0 0 0 0 1.5h3.14l-.435 3.148a.75.75 0 0 0 1.486.204L7.955 14h2.986l-.434 3.148a.75.75 0 0 0 1.486.204L12.456 14h3.346a.75.75 0 0 0 0-1.5h-3.14l.69-5h3.346a.75.75 0 0 0 0-1.5h-3.14l.435-3.148a.75.75 0 0 0-1.486-.204L12.045 6H9.059l.434-3.148ZM8.852 7.5l-.69 5h2.986l.69-5H8.852Z" clip-rule="evenodd" />
                    </svg>
                    <div>
                        <h1>Codes d'inscription</h1>
                        <h2>{{ trans_choice('auth.remaining_codes', $user->remaining_codes_count) }}</h2>
                    </div>
                </div>

                <div class="space-y-2">
                    @foreach ($codes as $code)
                    <input class="signup-code" type="text" readonly {{ $code->isConsumed() ? 'disabled' : '' }} value="{{ $code->code }}">
                    @endforeach
                </div>

            </div>
        </div>
    </main>

</x-app>