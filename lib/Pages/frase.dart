import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FraseScreen extends StatefulWidget {
  const FraseScreen({Key? key}) : super(key: key);

  @override
  State<FraseScreen> createState() => _FraseScreenState();
}

class _FraseScreenState extends State<FraseScreen> {
  // Frases
  List<String> list = [
    'El camino al éxito, es la actitud',
    'No busques los errores, busca un remedio',
    'Si te caíste ayer, levántate hoy',
    'La vida es una aventura, atrévete ',
    'El mejor momento del día es ahora',
    'El valor de una idea radica en su uso',
    'Haz de cada día tu obra maestra',
    'Quien persevera, lo consigue',
    'Haz el bien, sin mirar a quien',
    'Si la oportunidad no llama, construye una puerta',
    'No cuentes los días, haz que los días cuenten',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Frases del día',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 365,
          height: 800,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ReorderableListView.builder(
            header: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Ordenalas a tu gusto',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            itemBuilder: (context, index) {
              return ListTile(
                key: ValueKey(list[index]),
                title: Text(list[index]),
              );
            },
            itemCount: list.length,
            onReorder: (oldIndex, newIndex) {
              //list re-arrange
              if (oldIndex < newIndex) {
                newIndex--;
              }
              final item = list.removeAt(oldIndex);
              list.insert(newIndex, item);
            },
          ),
        ),
      ),
    );
  }
}
