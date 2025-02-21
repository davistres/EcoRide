<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'EcoRide') }}</title>

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css" />
    

 
    @if(config('app.env') === 'production')
    <link rel="stylesheet" href="{{ secure_asset('css/style.css') }}">
@else
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
@endif

   
</head>
<body>
   
    @include('layouts.navigation')

    
    <main>
        @yield('content')
    </main>

    
    @include('layouts.footer')
    <script defer src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"></script>
    <script defer src="{{ asset('js/script.js') }}"></script>
</body>
</html>
