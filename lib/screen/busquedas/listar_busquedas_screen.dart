import 'package:buscappme/screen/busquedas/index_busquedas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        title: const Text('Búsquedas'),
        centerTitle: true,
      ),
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
