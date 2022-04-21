import 'package:flutter/material.dart';
import 'package:weather_list_ui/api/weather_api.dart';
import 'package:weather_list_ui/models/weather_seven_days_daily_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_list_ui/widgets/city_view.dart';

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
    forecastObject!.then((weather) {
      print(weather.list![0].weather![0].main);
    });
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
                    CityView(),
                  ],
                );
              } else {
                return Center(
                    child: SpinKitDoubleBounce(
                  color: Colors.black,
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

Widget _buildBody() {
  return Column(
    children: [
      _searcher(),
      SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _weatherDescription(),
              Divider(),
              _currentTemperature(),
              Divider(),
              _temperatureForecast(),
            ],
          ),
        ),
      ),
    ],
  );
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

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "Murmansk Oblast, RU",
        style: TextStyle(
          fontSize: 32,
          color: Colors.white70,
        ),
      ),
      SizedBox(
        height: 6,
      ),
      Text(
        "Fridey, Mar 20,2020",
        style: TextStyle(
          color: Colors.white38,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Column _currentTemperature() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wb_sunny,
            color: Colors.white,
            size: 60,
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            children: [
              Text(
                "15 °F",
                style: TextStyle(
                    color: Colors.white38,
                    fontSize: 50,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "LIGHT SNOW",
                style: TextStyle(
                    color: Colors.white38,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 40.0, bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(
                  Icons.cloud,
                  color: Colors.white,
                ),
                Text(
                  "5",
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                ),
                Text(
                  "km/h",
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.cloud,
                  color: Colors.white,
                ),
                Text(
                  "3",
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                ),
                Text(
                  "%",
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.cloud,
                  color: Colors.white,
                ),
                Text(
                  "20",
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                ),
                Text(
                  "%",
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Column _temperatureForecast() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(
          bottom: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "7-DAY WEATHER FORECAST",
              style: TextStyle(
                color: Colors.white38,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      _listView(),
    ],
  );
}

Widget _listView() {
  return Container(
    height: 120,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _listItem(),
        SizedBox(
          width: 5,
        ),
        _listItem(),
        SizedBox(
          width: 5,
        ),
        _listItem(),
        SizedBox(
          width: 5,
        ),
        _listItem(),
        SizedBox(
          width: 5,
        ),
        _listItem(),
      ],
    ),
  );
}

Container _listItem() {
  return Container(
    width: 150,
    height: 70,
    color: Colors.white24,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Friday",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "6 °F",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.cloud,
              color: Colors.white,
              size: 30,
            ),
          ],
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
