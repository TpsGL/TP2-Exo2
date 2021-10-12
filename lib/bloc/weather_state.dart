import 'package:meta/meta.dart';
import 'package:weather_app/models/Weather.dart';


@immutable
abstract class WeatherState {}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded({required this.weather});

}

class WeatherError extends WeatherState {}
