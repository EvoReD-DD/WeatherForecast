import 'package:flutter/material.dart';
import 'package:weather_list_ui/api/weather_api.dart';
import 'package:weather_list_ui/models/weather_seven_days_daily_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_list_ui/widgets/city_view.dart';
import 'package:weather_list_ui/widgets/seven_days_forecast.dart';
import 'package:weather_list_ui/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast>? forecastObject;
  String _cityName = 'London';
  @override
  void initState() {
    super.initState();
    forecastObject =
        WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);
    // forecastObject!.then((weather) {
    //   print(weather.list![0].weather![0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        title: Text(
          "Weather Forecast",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: ListView(
        children: [
          Container(
              child: FutureBuilder<WeatherForecast>(
            future: forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    _searcher(),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CityView(
                              snapshot: snapshot,
                            ),
                            Divider(),
                            TempView(snapshot: snapshot),
                            Divider(),
                            SevenDaysForecast(
                              snapshot: snapshot,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            _footerRatings(),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                    child: SpinKitDoubleBounce(
                  color: Colors.white,
                  size: 100.0,
                ));
              }
            },
          ))
        ],
      ),
    );
  }
}

Padding _searcher() {
  return Padding(
    padding: const EdgeInsets.only(right: 10, left: 10, top: 8, bottom: 8),
    child: Row(
      children: [
        Icon(
          Icons.search,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Enter City Name",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    ),
  );
}

Row _footerRatings() {
  var _stars = Row(
    children: [
      Icon(Icons.star, size: 15, color: Colors.yellow),
      Icon(Icons.star, size: 15, color: Colors.yellow),
      Icon(Icons.star, size: 15, color: Colors.yellow),
      Icon(Icons.star, size: 15, color: Colors.black),
      Icon(Icons.star_half, size: 15, color: Colors.black),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        "info openweather.com",
        style: TextStyle(fontSize: 15),
      ),
      _stars,
    ],
  );
}
