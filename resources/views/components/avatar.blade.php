@props(['src' => null, 'size' => 'medium'])

<div class="avatar avatar-{{ $size }}">
    @if ($src === null)
    U
    @else
    <img src="{{ asset("storage/{$src}") }}" alt="U" />
    @endif
</div>