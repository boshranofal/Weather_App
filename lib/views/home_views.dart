import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/views/search_views.dart';
import 'package:weather_app/widget/no_weather_body.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 167, 209, 244),
          title: const Text(
            'Weather App 🌤️',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SearchViews();
                }));
              },
            ),
          ],
        ),
        body: const NoWeatherBody());
  }
}
