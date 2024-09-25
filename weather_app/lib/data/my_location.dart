import 'package:geolocator/geolocator.dart';

class MyLocation {
  double? myLongitude;
  double? myLatitude;

  Future<void> getMyCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      myLongitude = position.longitude;
      myLatitude = position.latitude;
    } catch (e) {
      print("위치 정보수신에 문제가 생겼습니다.");
    }
  }
}
