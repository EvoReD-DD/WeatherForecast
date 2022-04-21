class Constants {
  static const String Weather_App_id = '1369dd6b5ae78fc9952261ab9aa236b4';
  //static const String url =
  //'https://api.openweathermap.org/data/2.5/forecast/daily?q=London&units=metric&cnt=7&appid=${Weather_App_id}';
  static const String Weather_Base_Scheme = 'https://';
  static const String Weather_Base_Domain = 'api.openweathermap.org';
  static const String Weather_Forecast_Path = '/data/2.5/forecast/daily';
  static const String Weather_Icon_Path = '/img/w/';
  static const String Weather_image_url =
      Weather_Base_Scheme + Weather_Base_Domain + Weather_Icon_Path;
}
