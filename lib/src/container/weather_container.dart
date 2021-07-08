import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_app/src/models/app_state.dart';
import 'package:movie_app/src/models/location.dart';
import 'package:redux/redux.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({Key? key, required this.builder}) : super(key: key);
  final ViewModelBuilder<Location> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Location>(
      converter: (Store<AppState> store) => store.state.location!,
      builder: builder,
    );
  }
}
