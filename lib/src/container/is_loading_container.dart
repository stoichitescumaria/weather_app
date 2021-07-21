import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:weather_app/src/models/index.dart';
import 'package:redux/redux.dart';

class IsLoadingContainer extends StatelessWidget {
  const IsLoadingContainer({Key? key, required this.builder}) : super(key: key);
  final ViewModelBuilder<bool> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      builder: builder,
      converter: (Store<AppState> store) => store.state.isLoading!,
    );
  }
}
