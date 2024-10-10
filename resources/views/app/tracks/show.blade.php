<x-app :title='"Contribution n°2"'>

    <main class="container-wide two-cols space-y-8">

        <section>
            <h1>
                Contribution <small>n°2</small>
            </h1>

            <dl>
                <dt>Artiste</dt>
                <dd>Nom de l'artiste</dd>

                <dt>Titre</dt>
                <dd>Nom du titre</dd>

                <dt>Contributeur</dt>
                <dd class="flex-center">
                    <x-avatar size="medium" :src="null" /> user0001
                </dd>

                <dt>Lecteur</dt>
                <dd>
                    <iframe width="560" height="315" 
                        src="https://www.youtube-nocookie.com/embed/hYfz5adLxJc"
                        title="YouTube video player" frameborder="0" 
                        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share">
                    </iframe>
                </dd>
            </dl>
        </section>

        <div>
            <div class="block block-content space-y-8">
                <div class="title">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                        <path d="M18.375 2.25c-1.035 0-1.875.84-1.875 1.875v15.75c0 1.035.84 1.875 1.875 1.875h.75c1.035 0 1.875-.84 1.875-1.875V4.125c0-1.036-.84-1.875-1.875-1.875h-.75ZM9.75 8.625c0-1.036.84-1.875 1.875-1.875h.75c1.036 0 1.875.84 1.875 1.875v11.25c0 1.035-.84 1.875-1.875 1.875h-.75a1.875 1.875 0 0 1-1.875-1.875V8.625ZM3 13.125c0-1.036.84-1.875 1.875-1.875h.75c1.036 0 1.875.84 1.875 1.875v6.75c0 1.035-.84 1.875-1.875 1.875h-.75A1.875 1.875 0 0 1 3 19.875v-6.75Z" />
                    </svg>
                    <div>
                        <h1>Classement</h1>
                    </div>
                </div>

                <div class="space-y-2">
                    <dl>
                        <dt>Semaine</dt>
                        <dd>2024-S37</dd>
                    </dl>

                    <dl>
                        <dt>Position</dt>
                        <dd>1 / {{ trans_choice('tracks.count', 15) }}</dd>
                    </dl>

                    <dl>
                        <dt>Réactions</dt>
                        <dd>{{ trans_choice('tracks.likes', 3) }}</dd>
                    </dl>

                    <form action="" method="post">
                        @if (false)
                        <button class="secondary w-full">Je n'aime pas ce titre</button>
                        @else
                        <button class="primary w-full">J'aime ce titre</button>
                        @endif
                    </form>
                </div>
            </div>
        </div>
    </main>

</x-app>