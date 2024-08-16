import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService({
    required this.dio,
  });
  Future getWeather({required String cityName}) async {
    Response response = await dio.get(
        'https://api.weatherapi.com/v1/forecast.json?key=580d2c8407a8493b9ae71231241608&q=$cityName&days=10');

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }
}
