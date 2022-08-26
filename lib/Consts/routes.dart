import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_geolocation/Bindings/map_binding.dart';
import 'package:getx_geolocation/UI/screens/map_screen.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: '/', page: () => Mapscreen(), binding: MapBinding()),
];
