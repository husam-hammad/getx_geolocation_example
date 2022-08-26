import 'package:get/get.dart';
import 'package:getx_geolocation/Controllers/map_controller.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GeoMapController>(GeoMapController());
  }
}
