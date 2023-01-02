import 'package:buscappme/domain/models/busqueda_model.dart';
import 'package:flutter/material.dart';

class CardHomeWidget extends StatelessWidget {
  final Busqueda busqueda;
  final Function()? onTap;

  const CardHomeWidget(
      {super.key, required this.busqueda, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
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
                  SizedBox(height: 15,),

                  Column(
                    children: [
                      Text(
                        busqueda.nombre,  
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        busqueda.ciudad,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () => onTap!(),
    );
  }
}
