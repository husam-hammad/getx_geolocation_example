import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:getx_geolocation/Services/geolocator_service.dart';

class GeoMapController extends GetxController {
  Position? userlocation;
  GeoMapController({
    this.userlocation,
  });

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 0,
  );
  @override
  void onInit() async {
    super.onInit();
    userlocation = await determinePosition();
    update();
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position? position) {
      if (position != null) {
        userlocation = position;
        update();
      }
    });
  }

  Future getLocation() async {
    userlocation = await determinePosition();
    update();
  }
}
