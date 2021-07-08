import 'package:movie_app/src/actions/get_location.dart';
import 'package:movie_app/src/models/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, GetLocationSuccessful>(_getLocationSuccessful),
  TypedReducer<AppState, GetLocation>(_getLocation),
]);
AppState _getLocation(AppState state, GetLocation action) {
  return state.rebuild((AppStateBuilder b) {
    b.isLoading = true;
  });
}

AppState _getLocationSuccessful(AppState state, GetLocationSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..location = action.location.toBuilder()
      ..isLoading = false;
  });
}
