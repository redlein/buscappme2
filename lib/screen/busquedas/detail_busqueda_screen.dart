import 'package:buscappme/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:buscappme/domain/models/busqueda_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailBusquedaScreen extends StatelessWidget {
  final Busqueda busqueda;

  DetailBusquedaScreen({super.key, required this.busqueda});

  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalles'),
        ),
        body: Card(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(150),
                                child: (busqueda.fotos != null)
                                    ? Image.network(
                                        "https://tfscdnfyqymsvuhirhdi.supabase.co/storage/v1/object/public/buscappme-storage/IMG/${busqueda.fotos}",
                                        fit: BoxFit.cover,
                                      )
                                    : const Icon(
                                        Icons.photo,
                                        size: 70,
                                      ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox( height: 15 ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              busqueda.nombre,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Ciudad: " + busqueda.ciudad,
                        ),
                        Text("Última Vez Visto: " + busqueda.ultimaVisto),
                        Text("Comunicarse Con: " + busqueda.comunicarseCon),
                        Text("Edad: ${busqueda.edad} Años"),
                        Text("Fecha: ${busqueda.fecha}"),
                        Text("Vestimenta: ${busqueda.vestimenta}"),
                        SizedBox( height: 10 ),
                        (busqueda.latitud != null && busqueda.longitud != null) ?
                        SizedBox(
                          height: 300,
                          child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(busqueda.latitud!, busqueda.longitud!),
                                zoom: 15.0,
                            ),
                            markers: {
                              Marker(
                                markerId: const MarkerId("marker1"),
                                position: LatLng(busqueda.latitud!, busqueda.longitud!),
                                draggable: true,
                                onDragEnd: (value) {
                                },
                              ),
                            },
                          ),
                        ) : Container(),
            
                        SizedBox( height: 15 ),
            
                        (busqueda.url != null) ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              onPressed: () async {
                                final url = busqueda.url;
                                Uri uri = Uri.parse(url!);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                                } else {
                                  throw 'No se puede abrir $url';
                                }
                              },
                              color: ColorsPanel.cBase,
                              child: Text('Más Información', style: TextStyle(color: ColorsPanel.cWhite)),
                            )
                          ],
                        ) : Container()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
