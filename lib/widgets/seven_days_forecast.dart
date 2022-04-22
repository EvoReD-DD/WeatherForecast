import 'package:flutter/material.dart';
import 'package:weather_list_ui/models/weather_seven_days_daily_model.dart';
import 'package:weather_list_ui/widgets/forecast_card.dart';

class SevenDaysForecast extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast>? snapshot;
  const SevenDaysForecast({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
      Container(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: 8),
          itemCount: (snapshot?.data?.list?.length ?? 1),
          itemBuilder: (context, index) => Container(
            width: MediaQuery.of(context).size.width / 2.7,
            height: 160,
            color: Colors.white24,
            child: forecastCard(snapshot!, index),
          ),
        ),
      )
    ]);
  }
}
