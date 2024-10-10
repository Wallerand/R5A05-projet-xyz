<nav class="container-wide">
    <ul>
        <li @class(['current' => request()->routeIs('home')])>
            <a href="{{ route('home') }}"><span class="logo"><h1>XYZ</h1></span></a>
        </li>

        @auth
        <li @class(['current' => request()->routeIs('weeks.*', 'tracks.show')])>
            @if (request()->routeIs('tracks.show'))
            <a href="{{ route('weeks.show', ['week' => $week->uri]) }}">Classement</a>
            @else
            <a href="{{ route('weeks.index') }}">Classement</a>
            @endif
        </li>
        <li @class(['current' => false])>
            <a href="#">+ Contribuer</a>
        </li>
        @endauth
    </ul>

    @auth
    <ul class="nav-right">
        <li @class(['current' => request()->routeIs('profile.*')])>
            <a href="{{ route('profile.edit') }}">Profil</a>
        </li>
        <li>
            <form action="{{ route('logout') }}" method="post">
                @csrf
                <button type="submit">Se déconnecter</button>
            </form>
        </li>
    </ul>
    @endauth
</nav>