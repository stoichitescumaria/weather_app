import 'package:movie_app/src/actions/get_location.dart';
import 'package:movie_app/src/data/weather_api.dart';
import 'package:movie_app/src/models/app_state.dart';
import 'package:movie_app/src/models/location.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({required WeatherApi weatherApi}) : _weatherApi = weatherApi;
  final WeatherApi _weatherApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, GetLocation>(_getLocation),
    ];
  }

  Future<void> _getLocation(Store<AppState> store, GetLocation action, NextDispatcher next) async {
    next(action);
    try {
      final Location location = await _weatherApi.getLocation();
      store.dispatch(GetLocationSuccessful(location));
    } catch (error) {
      store.dispatch(GetLocationError(error));
    }
  }
}
