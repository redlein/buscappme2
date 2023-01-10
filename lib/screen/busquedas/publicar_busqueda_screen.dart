import 'package:buscappme/screen/busquedas/maps_provider.dart';
import 'package:buscappme/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:buscappme/screen/busquedas/index_busquedas.dart';

class PublicarBusquedaScreen extends StatelessWidget {
  const PublicarBusquedaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storageProvider = Provider.of<StorageImageProvider>(context);
    final busquedaService = Provider.of<BusquedaService>(context);

    return ChangeNotifierProvider(
      create: (_) => BusquedaFormProvider(busquedaService.seleccionarBusqueda),
      child: BusquedaFormWidget(
          storageProvider: storageProvider, busquedaService: busquedaService),
    );
  }
}

class BusquedaFormWidget extends StatelessWidget {
  final StorageImageProvider storageProvider;
  final BusquedaService busquedaService;

  const BusquedaFormWidget(
      {super.key,
      required this.storageProvider,
      required this.busquedaService});

  @override
  Widget build(BuildContext context) {
    final busquedaForm = Provider.of<BusquedaFormProvider>(context);
    final dato = busquedaForm.busqueda;
    final TextEditingController dateController = TextEditingController(text: dato.fecha);
    final mapProvider = Provider.of<MapsProvider>(context);
    mapProvider.refController.text = dato.ultimaVisto;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Publicar Nueva Búsqueda',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorsPanel.cWhite,
        actions: [
          IconButton(
            onPressed: () {
              storageProvider.activeCleanImage();
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.lightBlue,
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
                      const SizedBox(height: 10),
                      TextFormField(
                        onTap: () {
                          final data = mapProvider.openGoogleMap(context);
                          data.then((value) {
                            dato.ultimaVisto = value['address'];
                            dato.latitud = value['lat'];
                            dato.longitud = value['lng'];
                          });
                        },
                        autofocus: false,
                        focusNode: AlwaysDisableFocusNode(),
                        controller: mapProvider.refController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Última Vez Visto', 
                          hintStyle: TextStyle(color: Colors.black),

                          filled: true,
                          fillColor: ColorsPanel.cWhite,
                          prefixIcon: Icon(Icons.map),
                          enabledBorder: OutlineInputBorder(
                            borderSide:  BorderSide(width: 2, color: ColorsPanel.cBase),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onChanged: (value) => dato.ultimaVisto = value,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        initialValue: dato.comunicarseCon,
                        hintText: 'Comunicarse Con',
                        keyboardType: TextInputType.phone,
                        onChanged: (value) => dato.comunicarseCon = value,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: dateController,
                        keyboardType: TextInputType.none,
                        decoration: InputDecoration(
                          hintText: 'Fecha',
                          hintStyle: TextStyle(color: Colors.black),
                          fillColor: ColorsPanel.cWhite,
                          enabledBorder: OutlineInputBorder(
                            borderSide:  BorderSide(width: 2, color: ColorsPanel.cBase),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:  BorderSide(width: 2, color: ColorsPanel.cSkyBlue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          // fillColor: ColorsPanel.cWhite,
                          contentPadding: const EdgeInsets.all(15),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate:DateTime(2000),
                            lastDate: DateTime(2101)
                          );

                          if(pickedDate != null ){
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

                            dateController.text = formattedDate;
                            dato.fecha = formattedDate;
                            
                          }else{
                            print("Date is not selected");
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        maxLines: 5,
                        initialValue: dato.vestimenta,
                        hintText: 'Vestimenta:',
                        onChanged: (value) => dato.vestimenta = value,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        initialValue: dato.url,
                        hintText: 'Url',
                        onChanged: (value) => dato.url = value,
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
                      color: Colors.orange.shade100,
                    ),
                    child: (storageProvider.image != null ||
                            (dato.fotos != null && dato.id != null))
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(48),
                              child: (dato.fotos != null && dato.id != null)
                                  ? Image.network(
                                      "https://tfscdnfyqymsvuhirhdi.supabase.co/storage/v1/object/public/buscappme-storage/IMG/${dato.fotos}",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
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
                    dato.fotos = null;
                    storageProvider.activeGalleryImage().then((value) => dato.fotos = storageProvider.nameImage);
                  },
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color.fromARGB(255, 2, 72, 129),
                    onPressed: () {
                      storageProvider.activeCamaraImage().then((value) => dato.fotos = storageProvider.nameImage);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                        Text(
                          'Camara',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                      // dato.fotos = storageProvider.nameImage;
                      busquedaService.alertCustom(context, busquedaForm.busqueda, 'guardar').then(
                        (value) {
                          if (storageProvider.nameImage != null) {
                            storageProvider.subirImageStorage();
                          }
                          Navigator.of(context).pop();
                        }
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(
                          Icons.save,
                          color: Colors.white,
                        ),
                        Text(
                          'Guardar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

class AlwaysDisableFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}