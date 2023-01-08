import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:buscappme/screen/busquedas/client_adress_map_page.dart';

class MapsProvider extends ChangeNotifier {
  Position? position;

  LatLng? addressLatLng;
  String addressName = 'Calculando...';

  Future setLocationDraggableInfo() async {
    double lat = initialPosition.target.latitude;
    double lng = initialPosition.target.longitude;

    List<Placemark> address = await placemarkFromCoordinates(lat, lng);

    if (address.isNotEmpty) {
      String direction = address[0].thoroughfare ?? '';
      String street = address[0].subThoroughfare ?? '';
      String city = address[0].locality ?? '';
      String deparment = address[0].administrativeArea ?? '';

      addressName = '$direction #$street, $city, $deparment';
      addressLatLng = LatLng(lat, lng);

      print(
          'LAT LNG=> ${addressLatLng!.latitude} | ${addressLatLng!.longitude}');
      notifyListeners();
    }
  }

  //POSICION INICIAL
  CameraPosition initialPosition =
      const CameraPosition(target: LatLng(-12.0899056, -76.9648646), zoom: 14);

  Completer<GoogleMapController> mapController = Completer();

  //CAPTURAR LA UBICACION
  void selectRefPoint(BuildContext context) {
    if (addressLatLng != null) {
      Map<String, dynamic> data = {
        'address': addressName,
        'lat': addressLatLng!.latitude,
        'lng': addressLatLng!.longitude,
      };
      print('DATA => $data');
      Navigator.pop(context, data);
    }
  }

  //ACTIVAR MODAL
  TextEditingController refController = TextEditingController();

  Future openGoogleMap(BuildContext context) async {
    Map<String, dynamic> refPointMap = await showMaterialModalBottomSheet(
      context: context,
      builder: (context) => ClientAddressMapPage(),
      isDismissible: false,
      enableDrag: false,
    );
    refController.text = refPointMap['address'];
    print('REF POINT MAP ${refPointMap}');

    return refPointMap;
  }

  //RETROCEDER
  void backPage(BuildContext context) {
    Map<String, dynamic> data = {
      'address': '',
      'lat': 0.0,
      'lng': 0.0,
    };
    print('DATA => $data');
    Navigator.pop(context, data);
  }

  void onMapCreate(GoogleMapController controller) {
    // determinePosition();
    mapController.isCompleted == false;
    // mapController.complete(controller);
  }

  Future animateCamaraPosition(double lat, double lng) async {
    GoogleMapController controller = await mapController.future;

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 13,
          bearing: 0,
        ),
      ),
    );
  }
}
