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
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          child: SizedBox(
                              child: ClipRRect(
                            child: Image.asset(
                              'assets/logo.png',
                              width: 260,
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
                      Container(
                        width: 270,
                        height: 80,
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: const Text(
                                '927478925',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: const Text(
                                'buscappme@gmail.com',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Visibility(
                        visible: launcherProvider.isVisible,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).backgroundColor,
                            ),
                            width: MediaQuery.of(context).size.width * 0.7,
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
                                      heroTag: "email",
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
                                      heroTag: "phone",
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
                                      heroTag: "wsp",
                                      backgroundColor: Colors.green,
                                      child:
                                          const Icon(Icons.whatsapp_outlined),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 270,
                        height: 140,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Denuncia: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Doc. policial',
                                    style: TextStyle(
                                      fontSize: 18,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Datos: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Foto de DNI/P.Nacimiento',
                                    style: TextStyle(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Fotos: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '2 a 3 formato png/pjg',
                                    style: TextStyle(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Contacto: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Número de celular',
                                    style: TextStyle(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Correo: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Text(
                                    'gmail u otros',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
