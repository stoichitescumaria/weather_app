import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:movie_app/src/models/app_state.dart';
import 'package:movie_app/src/models/location.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[AppState, Location])
Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
