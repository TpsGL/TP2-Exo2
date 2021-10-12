








import 'package:weather_app/api/weather_api_client.dart';
import 'package:weather_app/models/Weather.dart';

class WeatherRepository{

    final WeatherApiClient weatherApiClient;
    WeatherRepository({required this.weatherApiClient});

    Future<Weather> getWeather(String cityName) async {
      var weather = await weatherApiClient.getWeatherData(cityName);
      var weathers = await weatherApiClient.getForecast(cityName);
      weather.forecast = weathers;
      return weather;
    }
}