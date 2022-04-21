import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_list_ui/models/weather_seven_days_daily_model.dart';
import 'package:weather_list_ui/utilities/forecast_util.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast>? snapshot;
  const TempView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var temp = snapshot?.data?.list?[0].temp?.day;
    var weather = snapshot?.data?.list?[0].weather?[0].main;

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
                  '$temp',
                  style: TextStyle(
                      color: Colors.white38,
                      fontSize: 50,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "$weather",
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
}
