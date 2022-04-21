import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_list_ui/models/weather_seven_days_daily_model.dart';
import 'package:weather_list_ui/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast>? snapshot;
  const CityView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot?.data?.list?[0].dt;
    var city = snapshot?.data?.city?.name;
    var country = snapshot?.data?.city?.country;
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch((forecastList ?? 1) * 1000);
    log('${formattedDate.toString()}');
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$city, $country',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white70,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          '${Util.getFormattedDate(formattedDate)}}',
          style: TextStyle(
            color: Colors.white38,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ));
  }
}
