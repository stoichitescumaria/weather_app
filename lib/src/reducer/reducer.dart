import 'package:movie_app/src/actions/get_location.dart';
import 'package:movie_app/src/actions/get_weather.dart';
import 'package:movie_app/src/models/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  (AppState state, dynamic action) {
    print(action);
    return state;
  },
  TypedReducer<AppState, GetWeatherSuccessful>(_getWeatherSuccessful),
  TypedReducer<AppState, GetLocation>(_getLocation),
]);

AppState _getLocation(AppState state, GetLocation action) {
  return state.rebuild((AppStateBuilder b) {
    b.isLoading = true;
  });
}

AppState _getWeatherSuccessful(AppState state, GetWeatherSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..weather = action.weather.toBuilder()
      ..isLoading = false;
  });
}
