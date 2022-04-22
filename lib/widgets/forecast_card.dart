import 'package:flutter/material.dart';
import 'package:weather_list_ui/utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data.list;
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  var dayOfWeek = '';
  dayOfWeek = fullDate.split(',')[0];
  var tempMin = forecastList[index].temp.min.toInt().toString();
  var icon = forecastList[index].getIconUrl();

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        dayOfWeek,
        style: const TextStyle(fontSize: 24, color: Colors.white),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$tempMin °C",
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(
            width: 8,
          ),
          Image.network(
            icon,
            color: Colors.white,
            scale: 1.2,
          )
        ],
      ),
    ],
  );
}
