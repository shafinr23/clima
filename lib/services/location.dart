import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLoc() async {
    try {
      final Geolocator geolocator = Geolocator()
        ..forceAndroidLocationManager = true;
      Position position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      );
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (err) {
      print(err.massage);
    }
  }
}
