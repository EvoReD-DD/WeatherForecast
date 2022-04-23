import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_list_ui/models/weather_seven_days_daily_model.dart';
import 'package:weather_list_ui/utilities/forecast_util.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast>? snapshot;
  const DetailView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot?.data?.list;
    var wind = forecastList?[0].speed;
    var humidity = forecastList?[0].humidity ?? 1;
    var pressure = forecastList?[0].pressure ?? 1 * 0.750062;

    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Util.getItem(FontAwesomeIcons.thermometerThreeQuarters,
              pressure.round(), 'mm Hg'),
          Util.getItem(FontAwesomeIcons.cloudRain, humidity.round(), '%'),
          Util.getItem(FontAwesomeIcons.thermometerThreeQuarters,
              wind?.toInt() ?? 1, 'm/s'),
        ],
      ),
    );
  }
}
