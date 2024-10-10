<x-mail::message>
# Bienvenue sur {{ config('app.name') }}

Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur voluptatibus dolorem harum saepe quasi, asperiores veniam dicta accusamus quam consectetur ab, eveniet cum eos maiores rerum. Nemo itaque esse consequuntur!

@foreach ($codes as $code)
- {{ $code->code }}
@endforeach

Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis quaerat aut animi velit voluptates illum quam dicta quis et, totam dolores cum repellendus laboriosam, beatae itaque fugiat possimus natus. Quibusdam.

<x-mail::button :url="$url">
Button Text
</x-mail::button>

Thanks,<br>
{{ config('app.name') }}
</x-mail::message>
