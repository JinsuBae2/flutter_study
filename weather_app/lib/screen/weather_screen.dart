import 'package:flutter/material.dart';
import 'package:weather_app/screen/weather_icon.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityName;
  int? myTemp;
  Widget? icon;
  WeatherIcon weatherIcon = WeatherIcon();

  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    cityName = weatherData['name'];
    double myTemp2 = weatherData['main']['temp'];
    myTemp = myTemp2.round();
    int condition = weatherData['weather'][0]['id'];
    icon = weatherIcon.getWeatherIcon(condition);
    print(cityName);
    print(myTemp);
    print(condition);
    print(icon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$cityName",
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "$myTemp\u2103",
                style: const TextStyle(
                  fontSize: 85,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              icon != null ? icon as Widget : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
