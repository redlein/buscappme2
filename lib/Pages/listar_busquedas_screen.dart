import 'package:buscappme/screen/drawer/drawerp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:buscappme/screen/busquedas/index_busquedas.dart';

class ListarBusquedasScreen extends StatelessWidget {
  const ListarBusquedasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final busquedaService = Provider.of<BusquedaService>(context);

    if (busquedaService.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Encuéntranos',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  busquedaService.listarBusquedas();
                },
                icon: const Icon(
                  Icons.refresh,
                  color: Color.fromARGB(255, 6, 197, 223),
                ))
          ]),
      body: ListView.builder(
        itemCount: busquedaService.busquedas.length,
        itemBuilder: (BuildContext context, int index) {
          final dato = busquedaService.busquedas[index];
          return CardCustom(
            onTap: () {
              busquedaService.seleccionarBusqueda =
                  busquedaService.busquedas[index].copyWith();
              Navigator.pushNamed(context, MyRoutes.rPUBLICARBUSQUEDA);
            },
            onDelete: () {
              busquedaService.alertCustom(context,
                  busquedaService.busquedas[index].copyWith(), 'eliminar');
            },
            title: Text(dato.nombre),
            subtitle: Text(dato.ciudad),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          busquedaService.seleccionarBusqueda = Busqueda(
              nombre: '',
              edad: 0,
              ciudad: '',
              ultimaVisto: '',
              comunicarseCon: '');
          Navigator.pushNamed(context, MyRoutes.rPUBLICARBUSQUEDA);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
