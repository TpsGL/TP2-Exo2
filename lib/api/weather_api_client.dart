

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/api/http_exceptions.dart';
import 'package:weather_app/models/Weather.dart';

class WeatherApiClient {
  static const baseUrl = 'http://api.openweathermap.org';
  final apiKey;
  final http.Client httpClient;

  WeatherApiClient({required this.httpClient, required this.apiKey})
      : assert(httpClient != null),
        assert(apiKey != null);

  /**
   *
   */
  Future<String> getCityNameFromLocation(
      {required double latitude, required double longitude}) async {
    final url =
        '$baseUrl/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    print('fetching $url');
    final res = await this.httpClient.get(Uri.parse(url));
    if (res.statusCode != 200) {
      throw HttpException(res.statusCode, "unable to fetch weather data");
    }
    final weatherJson = json.decode(res.body);
    return weatherJson['name'];
  }

  /**
   *
   */
  Future<Weather> getWeatherData(String cityName) async {
    final url = '$baseUrl/data/2.5/weather?q=$cityName&appid=$apiKey';
    print('fetching $url');
    final res = await this.httpClient.get(Uri.parse(url));
    if (res.statusCode != 200) {
      throw HttpException(res.statusCode, "unable to fetch weather data");
    }
    final weatherJson = json.decode(res.body);
    return Weather.fromJson(weatherJson);
  }

  /**
   *
   */
  Future<List<Weather>> getForecast(String cityName) async {
    final url = '$baseUrl/data/2.5/forecast?q=$cityName&appid=$apiKey';
    print('fetching $url');
    final res = await this.httpClient.get(Uri.parse(url));
    if (res.statusCode != 200) {
      throw HttpException(res.statusCode, "unable to fetch weather data");
    }
    final forecastJson = json.decode(res.body);
    List<Weather> weathers = Weather.fromForecastJson(forecastJson);
    return weathers;
  }
}
