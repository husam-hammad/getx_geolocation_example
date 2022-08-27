import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:getx_geolocation/Controllers/map_controller.dart';
import 'package:latlong2/latlong.dart';

class Mapscreen extends StatelessWidget {
  Mapscreen({Key? key}) : super(key: key);
  final GeoMapController mapController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: mapController,
          builder: (_) {
            return mapController.userlocation == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    color: Colors.white,
                    child: Stack(children: [
                      FlutterMap(
                        options: MapOptions(
                          zoom: 13.0,
                          maxZoom: 18,
                          center: LatLng(mapController.userlocation!.latitude,
                              mapController.userlocation!.longitude),
                        ),
                        layers: [
                          TileLayerOptions(
                              urlTemplate:
                                  "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                              subdomains: ['a', 'b', 'c']),
                          MarkerLayerOptions(
                            markers: [
                              Marker(
                                width: 50.0,
                                height: 50.0,
                                point: LatLng(
                                    mapController.userlocation!.latitude,
                                    mapController.userlocation!.longitude),
                                builder: (ctx) => const SizedBox(
                                  child: Icon(
                                    Icons.room,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
                  );
          }),
    );
  }
}
