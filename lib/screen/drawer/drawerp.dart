import 'package:buscappme/domain/providers/storage_provider.dart';
import 'package:buscappme/domain/services/auth_service.dart';
import 'package:buscappme/screen/busquedas/listar_busquedas_screen.dart';
import 'package:buscappme/screen/login/tab_login_screen.dart';
import 'package:buscappme/screen/frase.dart';
import 'package:buscappme/anuncios/anuncios.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  final List drawerMenuListname = const [
    {
      'leading': Icon(
        Icons.person_pin,
        color: Color.fromARGB(255, 11, 61, 168),
      ),
      'title': 'Personas desaparecidas',
      'trailing': Icon(
        Icons.chevron_right,
      ),
      'action_id': 1,
    },
    {
      'leading': Icon(
        Icons.mail_outlined,
        color: Color.fromARGB(255, 11, 61, 168),
      ),
      'title': 'Principal',
      'trailing': Icon(Icons.chevron_right),
      'action_id': 2,
    },
    {
      'leading': Icon(
        Icons.person_add_sharp,
        color: Color.fromARGB(255, 11, 61, 168),
      ),
      'title': 'Social',
      'trailing': Icon(Icons.chevron_right),
      'action_id': 3,
    },
    {
      'leading': Icon(
        Icons.local_offer,
        color: Color.fromARGB(255, 11, 61, 168),
      ),
      'title': 'Anuncios',
      'trailing': Icon(Icons.chevron_right),
      'action_id': 4,
    },
    {
      'leading': Icon(
        Icons.star_rate_rounded,
        color: Color.fromARGB(255, 11, 61, 168),
      ),
      'title': 'Favorito',
      'trailing': Icon(Icons.chevron_right),
      'action_id': 5,
    },
    // {
    //   'leading': Icon(
    //     Icons.label_important,
    //     color: Color.fromARGB(255, 253, 2, 2),
    //   ),
    //   'title': 'Importante',
    //   'trailing': Icon(Icons.chevron_right),
    //   'action_id': 6,
    // },
    // {
    //   'leading': Icon(
    //     Icons.send,
    //     color: Color.fromARGB(255, 19, 227, 36),
    //   ),
    //   'title': 'Enviar',
    //   'trailing': Icon(Icons.chevron_right),
    //   'action_id': 6,
    // },
    // {
    //   'leading': Icon(
    //     Icons.outbox,
    //     color: Color(0xFF13C0E3),
    //   ),
    //   'title': 'Mensajes enviados',
    //   'trailing': Icon(Icons.chevron_right),
    //   'action_id': 7,
    // },
    // {
    //   'leading': Icon(
    //     Icons.insert_drive_file_sharp,
    //     color: Color.fromARGB(255, 11, 61, 168),
    //   ),
    //   'title': 'Documentos',
    //   'trailing': Icon(Icons.chevron_right),
    //   'action_id': 8,
    // },
    {
      'leading': Icon(Icons.logout, color: Color.fromARGB(255, 11, 61, 168)),
      'title': 'Cerrar Sesión',
      'action_id': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return SafeArea(
      child: SizedBox(
        width: 260,
        child: Drawer(
          child: ListView(
            children: [
              const ListTile(
                leading: SizedBox(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/logo.png'),
                  ),
                ),
                title: Text(
                  'Buscappme',
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 4, 190),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // subtitle: Text(
                //   'buscappme@gmail.com',
                //   style: TextStyle(
                //     color: Color.fromARGB(255, 1, 43, 78),
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ),
              const SizedBox(
                height: 1,
              ),
              ...drawerMenuListname.map((sideMenuData) {
                return ListTile(
                  leading: sideMenuData['leading'],
                  title: Text(
                    sideMenuData['title'],
                  ),
                  trailing: sideMenuData['trailing'],
                  onTap: () {
                    if (sideMenuData['action_id'] == 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ListarBusquedasScreen(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 4) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AnunciosDemo(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 2) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FraseScreen(),
                        ),
                      );
                      // } else if (sideMenuData['action_id'] == 3) {
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //       builder: (context) => const SocialDemo(),
                      //     ),
                      //   );
                      // } else if (sideMenuData['action_id'] == 5) {
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //       builder: (context) => const Dropdownbuttonformfiel(),
                      //     ),
                      //   );
                    } else if (sideMenuData['action_id'] == 0) {
                      authService.cerrarSesion();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TabLoginScreen(),
                          ),
                          (route) => false);
                    }
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
