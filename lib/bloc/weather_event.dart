
abstract class WeatherEvent{

}

class FetchWeather extends WeatherEvent {
  final String cityName;
  /*final double longitude;
  final double latitude;*/

  FetchWeather({required this.cityName});
}

