<x-app title="Accueil">

    <main class="container-wide space-y-8">
        <section>
            <h1>
                Cette semaine <small>{{ trans_choice('tracks.count', $week->tracks_count) }}</small>
            </h1>

            <div class="grid">
                @foreach($tracks as $track)
                <a href="{{ route('tracks.show', ['week' => $track->week->uri, 'track' => $track]) }}" class="block image">
                    <img src="{{ $track->player_thumbnail_url }}" alt="">
                    <div class="description">
                        <div class="text-right">
                            #{{ $loop->iteration }}
                        </div>
                        <div>
                            <h2 class="truncate">{{ $track->artist }}</h2>
                            <h3 class="truncate">{{ $track->title }}</h3>
                        </div>
                    </div>
                </a>
                @endforeach

                <a class="block" href="{{ route('weeks.index') }}">
                    <div class="description">
                        <div class="text-right">
                            <svg class="size-8" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5 21 12m0 0-7.5 7.5M21 12H3" />
                            </svg>
                        </div>
                        <div>
                            <h3>Voir plus</h3>
                        </div>
                    </div>
                </a>
            </div>
        </section>

        <section>
            <h1>Semaines précédentes</h1>

            <div class="grid">
                @foreach($weeks as $week)
                <a href="{{ route('weeks.show', ['week' => $week->uri]) }}" class="block image">
                    <div class="description">
                        <div>
                            <!--  -->
                        </div>
                        <div>
                            <h2>{{ $week->name }}</h2>
                            <h3>{{ trans_choice('tracks.count', $week->tracks_count) }}</h3>
                        </div>
                    </div>
                </a>
                @endforeach
            </div>
        </section>

        <section>
            <h1>À propos</h1>
            <p>
                XYZ est une communauté musicale accessible sur invitation.
            </p>
            <ul>
                <li>Le contenu est regroupé par semaine</li>
                <li>Vous pouvez publier jusqu’à 2 titres chaque semaine</li>
                <li>La communauté détermine le classement de la semaine</li>
            </ul>
        </section>
    </main>
</x-app>