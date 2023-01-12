import 'package:buscappme/Pages/anuncios.dart';
import 'package:buscappme/screen/busquedas/detail_busqueda_screen.dart';
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
      drawer: DrawerScreen(),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Encuentranos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailBusquedaScreen(busqueda: dato),
                  ));
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        child: Card(
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnunciosDemo()));
            },
            child: Image.asset(
              'assets/banner1.png',
            ),
          ),
        ),
      ),
    );
  }
}
