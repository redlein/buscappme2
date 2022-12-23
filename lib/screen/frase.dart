import 'package:flutter/material.dart';

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
    'Si la oportunidad no llama, construye una puerta',
    'No cuentes los días, haz que los días cuenten',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frases del día'),
      ),
      body: ReorderableListView.builder(
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
    );
  }
}
