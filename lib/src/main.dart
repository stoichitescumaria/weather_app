import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:movie_app/src/actions/get_location.dart';
import 'package:movie_app/src/data/location_api.dart';
import 'package:movie_app/src/data/weather_api.dart';
import 'package:movie_app/src/epic/epic.dart';
import 'package:movie_app/src/models/app_state.dart';
import 'package:movie_app/src/presentation/home_page.dart';
import 'package:movie_app/src/reducer/reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

void main() {
  const String url = 'https://ipgeolocation.abstractapi.com/v1/?api_key=2e1dec55c6a24b2bac0a220399448a85';
  const String key = '9d8908b6fc679375a473d1f80873bc46';

  final Client client = Client();
  final LocationApi locationApi = LocationApi(apiUrl: url, client: client);
  final WeatherApi weatherApi = WeatherApi(key: key, client: client);

  final AppEpic epic = AppEpic(locationApi: locationApi, weatherApi: weatherApi);
  final AppState initialState = AppState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(epic.epics),
    ],
  );
  store.dispatch(const GetLocation());
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
