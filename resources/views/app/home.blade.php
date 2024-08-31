<x-app title="Accueil">

    <main class="container-wide space-y-8">
        <section>
            <h1>
                Cette semaine <small>{{ trans_choice('tracks.count', 15) }}</small>
            </h1>

            <div class="grid">

                <a href="" class="block image">
                    <img src="https://i1.sndcdn.com/artworks-000084043918-d575x4-t200x200.jpg" alt="">
                    <div class="description">
                        <div class="text-right">
                            #1
                        </div>
                        <div>
                            <h2 class="truncate">Artiste</h2>
                            <h3 class="truncate">Nom du titre</h3>
                        </div>
                    </div>
                </a>

                <a href="" class="block image">
                    <img src="https://img.youtube.com/vi/hYfz5adLxJc/hqdefault.jpg" alt="">
                    <div class="description">
                        <div class="text-right">
                            #2
                        </div>
                        <div>
                            <h2 class="truncate">Artiste</h2>
                            <h3 class="truncate">Nom du titre</h3>
                        </div>
                    </div>
                </a>

                {{-- More tracks --}}

                <a class="block" href="">
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
                <a href="" class="block image">
                    <div class="description">
                        <div>
                            <!--  -->
                        </div>
                        <div>
                            <h2>2024-S36</h2>
                            <h3>{{ trans_choice('tracks.count', 12) }}</h3>
                        </div>
                    </div>
                </a>

                <a href="" class="block image">
                    <div class="description">
                        <div>
                            <!--  -->
                        </div>
                        <div>
                            <h2>2024-S35</h2>
                            <h3>{{ trans_choice('tracks.count', 6) }}</h3>
                        </div>
                    </div>
                </a>

                <a href="" class="block image">
                    <div class="description">
                        <div>
                            <!--  -->
                        </div>
                        <div>
                            <h2>2024-S34</h2>
                            <h3>{{ trans_choice('tracks.count', 1) }}</h3>
                        </div>
                    </div>
                </a>

                <a href="" class="block image">
                    <div class="description">
                        <div>
                            <!--  -->
                        </div>
                        <div>
                            <h2>2024-S33</h2>
                            <h3>{{ trans_choice('tracks.count', 1) }}</h3>
                        </div>
                    </div>
                </a>

                {{-- More weeks --}}
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