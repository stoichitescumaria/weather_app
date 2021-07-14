import 'package:flutter/material.dart';
import 'package:movie_app/src/container/is_loading_container.dart';
import 'package:movie_app/src/container/weather_container.dart';
import 'package:movie_app/src/models/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: IsLoadingContainer(
        builder: (BuildContext context, bool isLoading) {
          if (isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return WeatherContainer(
            builder: (BuildContext context, Weather weather) {
              final double temp = weather.current!.temp! - 274.15;
              return Text(temp.toStringAsPrecision(3));
            },
          );
        },
      ),
    );
  }
}
