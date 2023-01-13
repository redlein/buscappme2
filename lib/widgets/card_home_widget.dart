import 'dart:io';
import 'package:buscappme/domain/models/busqueda_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class CardHomeWidget extends StatelessWidget {
  final Busqueda busqueda;
  final Function()? onTap;

  const CardHomeWidget({super.key, required this.busqueda, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Card(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
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
                      SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        title: Text(
                          busqueda.nombre,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Departamento: ' + busqueda.ciudad,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            final urlImage = "https://tfscdnfyqymsvuhirhdi.supabase.co/storage/v1/object/public/buscappme-storage/IMG/${busqueda.fotos}";
                            final url = Uri.parse(urlImage);
                            final response = await http.get(url);
                            final bytes = response.bodyBytes;
                            final temp = await getTemporaryDirectory();
                            final path = '${temp.path}/image.jpg';
                            File(path).writeAsBytesSync(bytes);

                            await Share.shareFiles( [path],  
                              text: 'Se busca a: ${busqueda.nombre} ${busqueda.edad} años \n desaparecido en: ${busqueda.ciudad} - ${busqueda.ultimaVisto} el día ${busqueda.fecha}, llevaba puesto: ${busqueda.vestimenta}, comunicarse al ${busqueda.comunicarseCon}',
                            );
                          }, 
                          icon: Icon(Icons.share)
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () => onTap!(),
    );
  }
}
