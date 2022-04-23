import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_list_ui/api/weather_api.dart';
import 'package:weather_list_ui/models/weather_seven_days_daily_model.dart';
import 'package:weather_list_ui/screens/city_screen.dart';
import 'package:weather_list_ui/widgets/city_view.dart';
import 'package:weather_list_ui/widgets/detail_view.dart';
import 'package:weather_list_ui/widgets/seven_days_forecast.dart';
import 'package:weather_list_ui/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final WeatherForecast? locationWeather;
  const WeatherForecastScreen({Key? key, this.locationWeather})
      : super(key: key);

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast>? forecastObject;
  late String _cityName;

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
    // forecastObject!.then((weather) {
    //   print(weather.list![0].weather![0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.location_city,
            ),
            onPressed: () async {
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return CityScreen();
              }));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(city: _cityName, isCity: true);
                });
              }
            },
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     _searcher(),
                    //   ],
                    // ),
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
                  child: Text(
                    'City not found/wrong name city',
                    textAlign: TextAlign.center,
                  ),
                  //   child: SpinKitDoubleBounce(
                  // color: Colors.white,
                  // size: 100.0,
                );
              }
            },
          ))
        ],
      ),
    );
  }
}

Widget _searcher() {
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
