import 'package:buscappme/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:buscappme/domain/models/busqueda_model.dart';

class DetailBusquedaScreen extends StatelessWidget {
  final Busqueda busqueda;
  const DetailBusquedaScreen({super.key, required this.busqueda});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Card(
        child: SizedBox(
          width: double.infinity,
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
                            child: (busqueda.fotos != null) ? 
                            Image.network(
                              "https://tfscdnfyqymsvuhirhdi.supabase.co/storage/v1/object/public/buscappme-storage/IMG/${busqueda.fotos}"
                              , fit: BoxFit.cover,
                            ) 
                            : const Icon(
                              Icons.photo,
                              size: 70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          busqueda.nombre,  
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text( "Ciudad: " + busqueda.ciudad ),
                    Text( "Última Vez Visto: " + busqueda.ultimaVisto ),
                    Text( "Comunicarse Con: " + busqueda.comunicarseCon ),
                    Text( "Edad: ${busqueda.edad} Años" ),
                    Text( "Fecha: ${busqueda.fecha}" ),
                    Text( "Vestimenta: ${busqueda.vestimenta}" ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(onPressed: (){}, color: ColorsPanel.cBase, child: Text('Más Información'),)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}