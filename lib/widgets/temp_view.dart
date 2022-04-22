import 'package:flutter/material.dart';
import 'package:weather_list_ui/models/weather_seven_days_daily_model.dart';
import 'package:weather_list_ui/widgets/detail_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast>? snapshot;
  const TempView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot?.data?.list;
    var temp = forecastList?[0].temp?.day?.round();
    var weather = forecastList?[0].weather?[0].description?.toUpperCase();
    var icon = forecastList?[0].getIconUrl();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              icon ?? '',
              color: Colors.white,
              scale: 0.7,
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Text(
                  '$temp °C',
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
        DetailDailyView(
          snapshot: snapshot,
        ),
      ],
    );
  }
}
