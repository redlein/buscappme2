import 'package:buscappme/domain/providers/launcher_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class contactoScreen extends StatefulWidget {
  const contactoScreen({Key? key}) : super(key: key);

  @override
  State<contactoScreen> createState() => _contactoScreenState();
}

class _contactoScreenState extends State<contactoScreen> {
  @override
  Widget build(BuildContext context) {
    final launcherProvider = Provider.of<LauncherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Requisitos'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => launcherProvider.activeMenu(),
            icon: const Icon(Icons.share_sharp),
          ),
        ],
      ),
      body: Stack(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: SizedBox(
                              child: ClipRRect(
                            child: Image.asset(
                              'assets/logo.png',
                              width: 300,
                            ),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'Contáctanos:',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          '927478925',
                          style: TextStyle(
                            fontSize: 17,
                            // color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'buscappme@gmail.com',
                          style: TextStyle(
                            fontSize: 17,
                            // color: Colors.black,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: launcherProvider.isVisible,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(1),
                            ),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        launcherProvider.goEmailLauncher();
                                      },
                                      backgroundColor: Colors.orange,
                                      child: const Icon(Icons.email),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        launcherProvider.goPhoneLauncher();
                                      },
                                      backgroundColor: Colors.cyan,
                                      child: const Icon(Icons.phone),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        launcherProvider.goWhatsappLauncher();
                                      },
                                      backgroundColor: Colors.green,
                                      child:
                                          const Icon(Icons.whatsapp_outlined),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Denuncia: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  'Doc. policial',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Datos: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  'Foto de DNI/P.Nacimiento',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Fotos: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  '2 a 3 formato png/pjg',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Contacto: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  'Número de celular',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Correo: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  'gmail u otros',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
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
    );
  }
}
