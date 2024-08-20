// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double tempe;
  final double maxtemp;
  final double mintemp;
  final String condition;
  final int humidity;
  final double windSpeed;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.tempe,
    required this.maxtemp,
    required this.mintemp,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      tempe: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      humidity: json['forecast']['forecastday'][0]['day']['avghumidity'],
      windSpeed: json['forecast']['forecastday'][0]['day']['maxwind_kph'],
    );
  }
}
