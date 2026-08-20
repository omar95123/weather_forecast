# Weather Forecast

A small Flutter app to search any city and see its current conditions plus a 5-day forecast, built with the free [Open-Meteo](https://open-meteo.com) API (no API key needed).

## Architecture

Structured the same way as the rest of my Flutter projects:

```
lib/
  main.dart                 # BlocObserver + MaterialApp.router bootstrap
  app_bloc.dart              # Singleton holding every Cubit + the BlocProvider list
  core/
    api/                     # DioClient wrapper, endpoints, API class
    application/              # App-wide bootstrap Cubit
    navigation/               # go_router setup, NamedRoutes, AppRoute wrapper
  shared/
    controllers/              # LoadingCubit, ErrorCubit
    models/                    # APIResultModel, BaseModel
    view/
      components/              # CustomButton, CustomTextField, LoadingWidget
      helper/                   # Palette, TextStyles, Space, export.dart
  theme/                      # ThemeModel, ThemeCubit, AppTheme (light/dark)
  utils/                      # Logger
  modules/
    weather/
      controller/              # WeatherCubit + WeatherState (Cubit/Equatable)
      models/                   # CityModel, WeatherModel, WeatherCode
      repository/               # WeatherRepository (talks to core/api)
      views/                    # WeatherHomeScreen + widgets/
```

State management: `flutter_bloc` (Cubit + Equatable states). Networking: `dio` with a `pretty_dio_logger` interceptor. Navigation: `go_router`.

## Setup

1. Generate the platform folders (android/ios/etc.) for your installed Flutter SDK — they aren't committed, since they're machine/version-specific:
   ```bash
   flutter create .
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run it:
   ```bash
   flutter run
   ```

No API key or `.env` file is required — Open-Meteo's geocoding and forecast endpoints are public.

## Push to GitHub

This folder is already a git repo with an initial commit. To publish it:

```bash
git remote add origin <your-repo-url>
git branch -M main
git push -u origin main
```
