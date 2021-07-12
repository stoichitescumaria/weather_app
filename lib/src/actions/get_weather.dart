import 'package:movie_app/src/models/weather.dart';

class GetWeather {
  const GetWeather(this.lat, this.lon);
  final double lat;
  final double lon;
  @override
  String toString() {
    return 'GetWeather{}';
  }
}

class GetWeatherSuccessful {
  const GetWeatherSuccessful(this.weather);

  final Weather weather;

  @override
  String toString() {
    return 'GetWeatherSuccessful{Weather: $Weather}';
  }
}

class GetWeatherError {
  const GetWeatherError(this.error);

  final dynamic error;

  @override
  String toString() {
    return 'GetWeatherError{error: $error}';
  }
}
