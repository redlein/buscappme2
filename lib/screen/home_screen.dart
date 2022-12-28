import 'package:buscappme/screen/busquedas/index_busquedas.dart';
import 'package:buscappme/screen/drawer/drawerp.dart';
import 'package:buscappme/widgets/card_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final busquedaService = Provider.of<BusquedaService>(context);

    if (busquedaService.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: busquedaService.busquedas.length,
        itemBuilder: (BuildContext context, int index) {
          final dato = busquedaService.busquedas[index];
          return CardHomeWidget(
            busqueda: dato,
            onTap: () {
              busquedaService.seleccionarBusqueda = busquedaService.busquedas[index].copyWith();
              Navigator.pushNamed(context, MyRoutes.rPUBLICARBUSQUEDA);
            },
          );
        },
      ),
    );
  }
}