<x-layout title="Rejoindre XYZ">
    <main class="auth container">
        <a href="/" class="logo">
            <h1>XYZ</h1>
        </a>

        <section class="block">

            <form action="{{ route('account') }}" method="get" class="block-content signup-form space-y-8">
                <div class="title">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M10 1a4.5 4.5 0 0 0-4.5 4.5V9H5a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-6a2 2 0 0 0-2-2h-.5V5.5A4.5 4.5 0 0 0 10 1Zm3 8V5.5a3 3 0 1 0-6 0V9h6Z" clip-rule="evenodd" />
                    </svg>

                    <h1>Devenir membre XYZ</h1>
                </div>

                <div>
                    <label for="email">Invité par</label>
                    <div class="host">
                        <x-avatar size="medium" :src="$user->avatar" />
                        <div>
                            <h1>{{ $user->username }}</h1>
                            <h2>{{ trans_choice('tracks.posts', 13) }}</h2>
                        </div>
                    </div>
                </div>
                
                <div>
                    <p>
                        XYZ est une communauté musicale accessible sur invitation.
                    </p>

                    <ul>
                        <li>Le contenu est regroupé par semaine</li>
                        <li>Vous pouvez publier jusqu’à 2 titres chaque semaine</li>
                        <li>La communauté détermine le classement de la semaine</li>
                    </ul>

                    <p>
                        Eligendi veniam architecto provident deleniti deserunt minus sint, inventore libero earum modi.
                    </p>
                </div>

                <div style="display: flex;">
                    <input type="checkbox" name="terms" id="terms" value="true">
                    <label for="terms">J'ai compris et j'accepte les règles</label>
                </div>

                @error('terms')
                <p class="error-message">{{ $message }}</p>
                @enderror

                <div>
                    <input type="hidden" name="code" value="{{ $code }}">
                    <button class="primary w-full">Continuer</button>
                </div>
            </form>
        </section>
    </main>
</x-layout>