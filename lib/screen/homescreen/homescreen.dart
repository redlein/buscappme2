import 'package:buscappme/domain/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:buscappme/screen/drawer/drawerp.dart';
import 'package:buscappme/routes/routes.dart';
import 'package:buscappme/preferences/preferences.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 4, 190),
        centerTitle: true,
        title: const Text(
          'Requisitos',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 230, 3),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Switch.adaptive(
              value: Preferences.theme,
              activeColor: const Color.fromARGB(255, 255, 234, 193),
              activeTrackColor: Colors.white,
              onChanged: (value) {
                Preferences.theme = value;
                final themeP =
                    Provider.of<ThemeProvider>(context, listen: false);
                value ? themeP.setOscuro() : themeP.setClaro();
                setState(() {});
              }),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              color: const Color.fromARGB(255, 81, 124, 243),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Costo',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 247, 222, 4),
                    ),
                  ),
                  Text(
                    'S/. 0',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 252, 250, 251),
                    ),
                  ),
                ],
              )),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: double.infinity,
              color: const Color.fromARGB(255, 253, 246, 177),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('assets/logo.png'),
                        ),
                      ),
                      const Text(
                        'Necesitamos los',
                        style: TextStyle(
                          fontSize: 28,
                          color: Color.fromARGB(255, 252, 123, 3),
                        ),
                      ),
                      const Text(
                        'sgtes datos:',
                        style: TextStyle(
                          fontSize: 28,
                          color: Color.fromARGB(255, 252, 123, 3),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Denuncia: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 3, 3),
                                  ),
                                ),
                                Text(
                                  'Doc. policial',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 17, 6, 114),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Datos: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 3, 3),
                                  ),
                                ),
                                Text(
                                  'DNI/P.Nacimiento',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 17, 6, 114),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Fotos: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 3, 3),
                                  ),
                                ),
                                Text(
                                  '2 a 3 formato png/pjg',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 17, 6, 114),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Contacto: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 3, 3),
                                  ),
                                ),
                                Text(
                                  'Número de celular',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 17, 6, 114),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, MyRoutes.rPUBLICARBUSQUEDA);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
