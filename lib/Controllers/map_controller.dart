import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:getx_geolocation/Services/geolocator_service.dart';

class GeoMapController extends GetxController {
  late Position? userlocation;

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 0,
  );
  @override
  void onInit() async {
    super.onInit();
    userlocation = await determinePosition();
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position? position) {
      if (position != null) {
        userlocation = position;
      }
    });
  }
}
