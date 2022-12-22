import 'package:buscappme/domain/models/busqueda_model.dart';
import 'package:buscappme/domain/providers/busqueda_form_provider.dart';
import 'package:buscappme/domain/providers/storage_provider.dart';
import 'package:buscappme/domain/services/busqueda_service.dart';
import 'package:buscappme/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicarBusquedaScreen extends StatelessWidget {
  const PublicarBusquedaScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final storageProvider = Provider.of<StorageImageProvider>(context);
    final busquedaService = Provider.of<BusquedaService>(context);

    return ChangeNotifierProvider(
      create: (_) => BusquedaFormProvider(busquedaService.seleccionarBusqueda),
      child: BusquedaFormWidget(storageProvider: storageProvider, busquedaService: busquedaService),
    );
  }
}


class BusquedaFormWidget extends StatelessWidget {
  final StorageImageProvider storageProvider;
  final BusquedaService busquedaService;

  const BusquedaFormWidget({super.key, required this.storageProvider, required this.busquedaService});

  @override
  Widget build(BuildContext context) {

    final busquedaForm = Provider.of<BusquedaFormProvider>(context);
    final dato = busquedaForm.busqueda;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicar Nueva Búsqueda'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              storageProvider.activeCleanImage();
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        initialValue: dato.nombre,
                        hintText: 'Nombre',
                        onChanged: (value) => dato.nombre = value,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        initialValue: "${dato.edad}",
                        hintText: 'Edad',
                        keyboardType: TextInputType.number,
                        onChanged: (value) => dato.edad = int.tryParse(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        initialValue: dato.ciudad,
                        hintText: 'Ciudad',
                        onChanged: (value) => dato.ciudad = value,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        maxLines: 5,
                        initialValue: dato.ultimaVisto,
                        hintText: 'Última Vez Visto:',
                        onChanged: (value) => dato.ultimaVisto = value,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      
                      CustomTextFormField(
                        initialValue: dato.comunicarseCon,
                        hintText: 'Comunicar Con',
                        keyboardType: TextInputType.phone,
                        onChanged: (value) => dato.comunicarseCon = value,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber,
                    ),
                    child: (storageProvider.image != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(48),
                              child: Image.file(
                                storageProvider.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : const Icon(
                            Icons.photo,
                            size: 100,
                          ),
                  ),
                  onTap: () {
                    storageProvider.activeGalleryImage();
                  },
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: const Color.fromARGB(255, 250, 248, 157),
                    onPressed: () {
                      storageProvider.activeCamaraImage();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.camera_alt),
                        Text('Camara'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.amber,
                    onPressed: () {
                      dato.fotos = storageProvider.nameImage;
                      busquedaService.alertCustom(context, busquedaForm.busqueda);
                      storageProvider.subirImageStorage();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.save),
                        Text('Guardar'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

