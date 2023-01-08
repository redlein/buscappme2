import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:buscappme/screen/busquedas/maps_provider.dart';

class ClientAddressMapPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mapProvider = Provider.of<MapsProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marcador'),
        leading: IconButton(
          onPressed: () {
            mapProvider.backPage(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition: mapProvider.initialPosition,
              mapType: MapType.normal,
              onMapCreated: mapProvider.onMapCreate,
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
              onCameraMove: (position) {
                mapProvider.initialPosition = position;
              },
              onCameraIdle: () async {
                //OBTENER LA LAT & LNG
                await mapProvider.setLocationDraggableInfo();
              },
            ),
          ),
          _iconMyLocation(),
          _cardAddress(lugar: mapProvider.addressName),
          _buttonAccept(context)
        ],
      ),
    );
  }

  Widget _buttonAccept(BuildContext context) {
    final mapProvider = Provider.of<MapsProvider>(context);
    return Container(
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.pink,
        onPressed: () {
          mapProvider.selectRefPoint(context);
        },
        child: const Text(
          'Seleccionar Punto',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _cardAddress({String? lugar}) {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Card(
        color: Colors.grey[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Text(
            lugar!,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _iconMyLocation() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 65,
        height: 65,
        child: const Icon(
          Icons.location_on,
          size: 65,
          color: Colors.pink,
        ),
      ),
    );
  }
}