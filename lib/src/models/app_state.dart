library app_state;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movie_app/src/models/serializers.dart';
import 'package:movie_app/src/models/weather.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() {
    return _$AppState((AppStateBuilder b) {
      b.isLoading = true;
    });
  }

  factory AppState.fromJson(dynamic json) => serializers.deserializeWith(serializer, json)!;

  AppState._();

  Weather? get weather;

  bool? get isLoading;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
