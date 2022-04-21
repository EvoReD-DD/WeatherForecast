import 'package:flutter/material.dart';
import 'package:weather_list_ui/models/weather_seven_days_daily_model.dart';
import 'package:weather_list_ui/screens/weather_forecast_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherForecastScreen(),
    );
  }
}
