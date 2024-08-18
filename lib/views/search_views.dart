//import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchViews extends StatelessWidget {
  const SearchViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              WeatherModel weatherModel =
                  await WeatherService(dio: Dio()).getWeather(cityName: value);
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              labelText: 'Search',
              hintText: 'Enter City Name',
              suffixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
