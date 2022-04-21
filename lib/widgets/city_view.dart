import 'package:flutter/material.dart';
import 'package:weather_list_ui/models/weather_seven_days_daily_model.dart';
import 'package:weather_list_ui/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast>? snapshot;
  const CityView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot?.data?.list?[0].dt;
    var city = snapshot?.data?.city?.name;
    var country = snapshot?.data?.city?.country;
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList * 1000);
    return Container(
      child: Column(
        children: [
          Text('$city, $country'),
          Text('${Util.getFormattedDate(formattedDate)}}')
        ],
      ),
    );
  }
}
