class WeatherModel {
  final String cityName;
  final String date;
  final String? image;
  final String tempe;
  final String maxtemp;
  final String mintemp;
  final String condition;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.tempe,
    required this.maxtemp,
    required this.mintemp,
    required this.condition,
  });
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      tempe: json['forecast']['forecastday'][0]['day']['avgtemp_c'].toString(),
      maxtemp:
          json['forecast']['forecastday'][0]['day']['maxtemp_c'].toString(),
      mintemp:
          json['forecast']['forecastday'][0]['day']['mintemp_c'].toString(),
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
