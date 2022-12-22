import 'package:flutter/material.dart';

class AnunciosDemo extends StatelessWidget {
  const AnunciosDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Tu frase del día es...'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text('Hola!'),
      ),
    );
  }
}
