@props(['src' => null, 'size' => 'medium'])

@php
    $src = null;
@endphp

<div class="avatar avatar-{{ $size }}">
    @if ($src === null)
    U
    @else
    <img src="" alt="U" />
    @endif
</div>