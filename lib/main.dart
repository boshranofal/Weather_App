import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_views.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, GetWeatherState>(
          builder: (context, state) {
            // Handle the case when weatherModel is null
            final condition = BlocProvider.of<GetWeatherCubit>(context)
                .weatherModel
                ?.condition;

            return MaterialApp(
              theme: ThemeData(
                primaryColor: condition != null
                    ? getWeatherColor(condition)
                    : Colors.blue, // Default color if condition is null
                appBarTheme: AppBarTheme(
                  color: condition != null
                      ? getWeatherColor(condition)
                      : Colors.blue, // Ensure AppBar uses the same color
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeViews(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getWeatherColor(String? day) {
  if (day == null) {
    return Colors.grey;
  }
  switch (day) {
    case 'Sunny':
    case 'Clear':
      return Colors.yellow;
    case 'Partly cloudy':
      return Colors.lightBlue;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Light rain':
      return Colors.blue;
    case 'Moderate rain at times':
    case 'Moderate rain':
      return Colors.blue;
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
      return Colors.lightBlue;
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
      return Colors.lightBlue;
    case 'Blizzard':
      return Colors.blueGrey;
    case 'Patchy sleet possible':
    case 'Light sleet':
      return Colors.grey;
    case 'Moderate or heavy sleet':
      return Colors.grey;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
      return Colors.deepPurple;
    case 'Moderate or heavy rain with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    case 'Fog':
      return Colors.grey;
    case 'Freezing fog':
      return Colors.grey;
    case 'Patchy light drizzle':
    case 'Light drizzle':
      return Colors.blue;
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.blueGrey;
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.blueGrey;
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.cyan;
    default:
      return Colors.grey; // Default for unhandled cases
  }
}
