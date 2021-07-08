import 'package:movie_app/src/models/location.dart';

class GetLocation {
  const GetLocation();
  @override
  String toString() {
    return 'GetLocation{}';
  }
}

class GetLocationSuccessful {
  const GetLocationSuccessful(this.location);

  final Location location;

  @override
  String toString() {
    return 'GetLocationSuccessful{location: $location}';
  }
}

class GetLocationError {
  const GetLocationError(this.error);

  final dynamic error;

  @override
  String toString() {
    return 'GetLocationError{error: $error}';
  }
}
