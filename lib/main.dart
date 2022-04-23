import 'package:flutter/material.dart';
import 'package:weather_list_ui/screens/location_screen.dart';
import 'package:weather_list_ui/screens/weather_forecast_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LocationScreen(),
    );
  }
}
