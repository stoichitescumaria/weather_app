part of models;

abstract class Location implements Built<Location, LocationBuilder> {
  factory Location([void Function(LocationBuilder b) updates]) = _$Location;

  factory Location.fromJson(dynamic json) => serializers.deserializeWith(serializer, json)!;

  Location._();

  double get latitude;

  double get longitude;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<Location> get serializer => _$locationSerializer;
}
