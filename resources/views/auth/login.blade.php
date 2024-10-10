<x-layout title="Se connecter">
    <main class="auth container">
        <a href="/" class="logo">
            <h1>XYZ</h1>
        </a>

        <section class="block">

            <form method="post" action="{{ route('authenticate') }}" class="block-content space-y-4">
                <div class="title">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M10 1a4.5 4.5 0 0 0-4.5 4.5V9H5a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-6a2 2 0 0 0-2-2h-.5V5.5A4.5 4.5 0 0 0 10 1Zm3 8V5.5a3 3 0 1 0-6 0V9h6Z" clip-rule="evenodd" />
                    </svg>

                    <h1>Accès membres XYZ</h1>
                </div>

                <div>
                    <label for="email">Adresse email</label>
                    <input id="email" name="email" type="text" placeholder="email" class="w-full" autocomplete="email" autofocus value="">
                </div>

                <div>
                    <label for="password">Mot de passe</label>
                    <input id="password" name="password" type="password" placeholder="•••••••••••••••" class="w-full">
                </div>

                @error('email')
                <p class="error-message">{{ $message }}</p>
                @enderror

                <div>
                    @csrf
                    <button class="primary w-full">Se connecter</button>
                </div>
            </form>

            <hr>

            <form method="get" action="{{ route('terms') }}" class="block-content space-y-4">
                <div>
                    <label for="code">Code d'inscription</label>
                    <input id="code" type="text" placeholder="code" name="code" value="" class="w-full uppercase">
                </div>

                @error('code')
                <p class="error-message">{{ $message }}</p>
                @enderror

                <div>
                    <button class="secondary w-full">Devenir membre XYZ</button>
                </div>
            </form>
        </section>
    </main>
</x-layout>