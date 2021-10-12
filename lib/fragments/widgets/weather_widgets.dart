import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:weather_app/models/Weather.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  WeatherWidget({required this.weather}) : assert(weather != null);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            this.weather.cityName.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w900,
                letterSpacing: 5,
                //color: AppStateContainer.of(context).theme.accentColor,
                fontSize: 25),
          ),
        ],
      ),
    );
  }
}