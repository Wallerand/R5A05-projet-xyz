@props(['title' => null])

<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ isset($title) ? "{$title} — " : '' }}{{ config('app.name') }}</title>
    <link rel="stylesheet" href="{{ asset('/css/normalize.css') }}">
    <link rel="stylesheet" href="{{ asset('/css/app.css') }}">
</head>
<body>

    {{ $slot }}

</body>
</html>