import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/src/models/weather.dart';

class WeatherApi {
  const WeatherApi({required String key, required Client client})
      : _client = client,
        _key = key;
  final Client _client;
  final String _key;

  Future<Weather> getWeather(double lat, double lon) async {
    final Response response = await _client.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,daily&appid=$_key'));
    if (response.statusCode >= 300) {
      throw StateError(response.body);
    }
    return Weather.fromJson(jsonDecode(response.body));
  }
}
