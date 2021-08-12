import 'dart:async';

import 'package:double_dice/data/models/location.dart';
import 'package:double_dice/routing/app_pages.dart';
import 'package:double_dice/screens/dice/dicepage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final splashDelay = 4;

  Position currentLocation = Position(longitude: 75.7139, latitude: 19.7515,
      timestamp: DateTime.now(), accuracy: 1.0, altitude: 100, heading:60,
      speed: 0.0, speedAccuracy: 0.0,);

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  void getLocation() async {
    currentLocation = await _determinePosition();
  }

  @override
  void onInit() {
    super.onInit();
    getLocation();
    splashTimer();
  }

  splashTimer() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    // PrefData().isUserLoginIn()
    //     ? Get.offNamed(Routes.mainPage)
    //     : Get.offNamed(Routes.loginOptionsPage);
    // Get.offNamed(Routes.dicepage,
    // arguments: Location(currentLocation.latitude,currentLocation.longitude ));
    Get.to(()=>DicePage(location: Location(
      currentLocation.latitude,currentLocation.longitude
    )));
  }

  // @override
  // void onClose() {
  //   print("currentLocation.latitude : ${currentLocation.latitude}");
  //   print("currentLocation.longitude : ${currentLocation.longitude}");
  //
  //   double latitude = currentLocation.latitude ?? 19.7515;
  //   double longitude = currentLocation.longitude ?? 75.7139;
  //
  //   // PrefData().setCurrentLocationLatitude(latitude);
  //   // PrefData().setCurrentLocationLongitude(longitude);
  //
  //   super.onClose();
  // }
}
