import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_app/src/actions/index.dart';
import 'package:weather_app/src/data/location_api.dart';
import 'package:weather_app/src/data/weather_api.dart';
import 'package:weather_app/src/models/index.dart';

class AppEpic {
  const AppEpic({required LocationApi locationApi, required WeatherApi weatherApi})
      : _locationApi = locationApi,
        _weatherApi = weatherApi;
  final LocationApi _locationApi;
  final WeatherApi _weatherApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetLocationStart>(_getLocation),
      TypedEpic<AppState, GetLocationSuccessful>(_getWeather),
    ]);
  }

  Stream<Object> _getLocation(Stream<GetLocation> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetLocation event) => _locationApi.getLocation())
        .map<Object>((Location location) => GetLocationSuccessful(location))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => GetLocationError(error,stackTrace));
  }

  Stream<Object> _getWeather(Stream<GetLocationSuccessful> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap(
            (GetLocationSuccessful event) => _weatherApi.getWeather(event.location.latitude, event.location.longitude))
        .map<Object>((Weather weather) => GetWeatherSuccessful(weather))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => GetWeatherError(error,stackTrace));
  }
}
