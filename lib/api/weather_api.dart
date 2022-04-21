import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as https;
import 'package:weather_list_ui/models/weather_seven_days_daily_model.dart';
import 'package:weather_list_ui/utilities/constants.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {String? cityName}) async {
    var queryParameters = {
      'AppID': Constants.Weather_App_id,
      'units': 'metric',
      'q': cityName
    };
    var uri = Uri.https(Constants.Weather_Base_Domain,
        Constants.Weather_Forecast_Path, queryParameters);
    log('request: ${uri.toString()}');
    var response = await https.get(uri);
    print('response: ${response.body}');
    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
