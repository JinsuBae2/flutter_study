import 'package:flutter/material.dart';
import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screen/weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apiKey = 'ccd85fc9d6c2748003798239da74bad3';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? myLongitude2;
  double? myLatitude2;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    myLatitude2 = myLocation.myLatitude;
    myLongitude2 = myLocation.myLongitude;
    NetWork netWork = NetWork(
        "https://api.openweathermap.org/data/2.5/weather?lat=$myLatitude2&lon=$myLongitude2&appid=$apiKey&units=metric");
    var weatherData = await netWork.getJsonData();
    print(weatherData);
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherScreen(
          parseWeatherData: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: const Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }
}
