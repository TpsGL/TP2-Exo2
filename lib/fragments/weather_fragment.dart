

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/api/api_access.dart';
import 'package:weather_app/api/weather_api_client.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/repository/weather_repository.dart';
import 'package:http/http.dart' as http;


class WeatherScreen extends StatefulWidget {
  final WeatherRepository weatherRepository = WeatherRepository
    (weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    apiKey: ApiAccess.OPEN_WEATHER_MAP
  ));

  @override
  State<WeatherScreen> createState() => _WeatherScreenStateState();
}


class _WeatherScreenStateState extends State<WeatherScreen> {

  late WeatherBloc _weatherBloc;

  @override
  void initState() {
    super.initState();
    _weatherBloc = WeatherBloc(weatherRepository: widget.weatherRepository);

  }

  @override
  Widget build(BuildContext context) {
    var myController = TextEditingController();

    //return SafeArea( child:
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("My Weather App"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      onSubmitted: (value){
                       _weatherBloc.add( FetchWeather(cityName: value) );
                        print(value);
                      },
                      controller: myController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: "Enter you City Name",
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              /*Container(
                constraints: BoxConstraints.expand(),
                child: BlocBuilder(bloc: _weatherBloc,
                    builder: (context, state ){
                  return Text("Hello Wolrd");
                })

              )*/

              ])
            )
          );
     //   );
  }




}

