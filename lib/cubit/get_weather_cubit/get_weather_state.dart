import 'package:weather_app/models/weather_model.dart';

class GetWeatherState {}

class NoWeatherState extends GetWeatherState {}

class WeatherLodedState extends GetWeatherState {
  final WeatherModel weatherModel;
  WeatherLodedState({required this.weatherModel});
}

class WeatherFailedState extends GetWeatherState {}
