import 'package:movie_app/src/actions/get_location.dart';
import 'package:movie_app/src/actions/get_weather.dart';
import 'package:movie_app/src/data/location_api.dart';
import 'package:movie_app/src/data/weather_api.dart';
import 'package:movie_app/src/models/app_state.dart';
import 'package:movie_app/src/models/location.dart';
import 'package:movie_app/src/models/weather.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({required LocationApi locationApi, required WeatherApi weatherApi})
      : _locationApi = locationApi,
        _weatherApi = weatherApi;
  final LocationApi _locationApi;
  final WeatherApi _weatherApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, GetLocation>(_getLocation),
      TypedMiddleware<AppState, GetLocationSuccessful>(_getLocationSuccessful),
      TypedMiddleware<AppState, GetWeather>(_getWeather),
    ];
  }

  Future<void> _getLocation(Store<AppState> store, GetLocation action, NextDispatcher next) async {
    next(action);
    try {
      final Location location = await _locationApi.getLocation();
      store.dispatch(GetLocationSuccessful(location));
    } catch (error) {
      store.dispatch(GetLocationError(error));
    }
  }

  Future<void> _getLocationSuccessful(Store<AppState> store, GetLocationSuccessful action, NextDispatcher next) async {
    next(action);
    store.dispatch(GetWeather(action.location.lat, action.location.lon));
  }

  Future<void> _getWeather(Store<AppState> store, GetWeather action, NextDispatcher next) async {
    next(action);
    try {
      final Weather weather = await _weatherApi.getWeather(action.lat, action.lon);
      store.dispatch(GetWeatherSuccessful(weather));
    } catch (error) {
      store.dispatch(GetWeatherError(error));
    }
  }
}
