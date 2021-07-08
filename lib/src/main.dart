import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:movie_app/src/actions/get_location.dart';
import 'package:movie_app/src/data/weather_api.dart';
import 'package:movie_app/src/middleware/app_middleware.dart';
import 'package:movie_app/src/models/app_state.dart';
import 'package:movie_app/src/presentation/home_page.dart';
import 'package:movie_app/src/reducer/reducer.dart';
import 'package:redux/redux.dart';

void main() {
  const String url = 'http://ip-api.com/json/?fields=61439';
  final Client client = Client();
  final WeatherApi weatherApi = WeatherApi(apiUrl: url, client: client);
  final AppMiddleware middleware = AppMiddleware(weatherApi: weatherApi);
  final AppState initialState = AppState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: middleware.middleware,
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
