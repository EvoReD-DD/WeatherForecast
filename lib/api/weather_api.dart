import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as https;
import 'package:weather_list_ui/models/weather_seven_days_daily_model.dart';
import 'package:weather_list_ui/utilities/constants.dart';
import 'package:weather_list_ui/utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? city, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();
    Map<String, String?> parameters;

    if (isCity == true) {
      var params = {
        'appid': Constants.Weather_App_id,
        'units': 'metric',
        'q': city
      };
      parameters = params;
    } else {
      var params = {
        'appid': Constants.Weather_App_id,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = params;
    }

    var uri = Uri.https(Constants.Weather_Base_Domain,
        Constants.Weather_Forecast_Path, parameters);
    log('request: ${uri.toString()}');

    var response = await https.get(uri);

    // print('response: ${response.body}');
    log('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
