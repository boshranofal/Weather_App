// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    Key? key,
    required this.weather,
  }) : super(key: key);
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getWeatherColor(weatherModel.condition),
              Colors.indigo.shade500,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                Text(
                  weatherModel.cityName,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  weatherModel.condition,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 10),
                Image.network(
                  'https:${weatherModel.image}',
                  height: 100,
                ),
                const SizedBox(height: 4),
                Text(
                  weatherModel.tempe.round().toString() + '°',
                  style: const TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //const SizedBox(height: ),
                Text(
                  ' ${weatherModel.date.day}-${weatherModel.date.month}-${weatherModel.date.year} | ${weatherModel.date.hour}:${weatherModel.date.minute}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            // معلومات الطقس
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.indigo.shade400.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //buildWeatherInfo(Icons.grain, precipitation, 'Precipitation'),
                  buildWeatherInfo(Icons.water_drop,
                      weatherModel.humidity.toString(), 'Humidity'),
                  buildWeatherInfo(
                      Icons.air,
                      weatherModel.windSpeed.toString() + ' km/h',
                      'Wind Speed'),
                ],
              ),
            ),
            weatherModel.hourWeather.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: weatherModel.hourWeather.map((hourData) {
                        return buildHourlyCard(
                          time: hourData['time'].split(' ')[1],
                          iconUrl: 'https:${hourData['condition']['icon']}',
                          temperature: '${hourData['temp_c']}°',
                        );
                      }).toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildWeatherInfo(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(height: 10),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }

  Widget buildHourlyCard(
      {required String time,
      required String iconUrl,
      required String temperature}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade700,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 5),
          Image.network(
            iconUrl,
            width: 40,
          ),
          const SizedBox(height: 5),
          Text(
            temperature,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
