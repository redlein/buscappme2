import 'package:buscappme/Pages/profile_page.dart';
import 'package:buscappme/screen/drawer/index_drawer.dart';
import 'package:buscappme/Pages/contactoscreen.dart';
import 'package:buscappme/Pages/colaboradoresScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  final List drawerMenuListname = const [
    {
      'leading': Icon(
        Icons.person_pin,
        color: Color.fromARGB(255, 6, 197, 223),
      ),
      'title': 'Perfil',
      'trailing': Icon(
        Icons.chevron_right,
      ),
      'action_id': 1,
    },
    {
      'leading': Icon(
        Icons.person_pin,
        color: Color.fromARGB(255, 6, 197, 223),
      ),
      'title': 'Colaboradores',
      'trailing': Icon(
        Icons.chevron_right,
      ),
      'action_id': 2,
    },
    {
      'leading': Icon(
        Icons.mail_outlined,
        color: Color.fromARGB(255, 6, 197, 223),
      ),
      'title': 'Personas encontradas',
      'trailing': Icon(Icons.chevron_right),
      'action_id': 3,
    },
    {
      'leading': Icon(
        Icons.local_offer,
        color: Color.fromARGB(255, 6, 197, 223),
      ),
      'title': 'Anuncios',
      'trailing': Icon(Icons.chevron_right),
      'action_id': 4,
    },
    {
      'leading': Icon(
        Icons.star_rate_rounded,
        color: Color.fromARGB(255, 6, 197, 223),
      ),
      'title': 'Frase del Día',
      'trailing': Icon(Icons.chevron_right),
      'action_id': 5,
    },
    {
      'leading': Icon(
        Icons.contact_mail_outlined,
        color: Color.fromARGB(255, 6, 197, 223),
      ),
      'title': 'Contacto',
      'trailing': Icon(
        Icons.chevron_right,
      ),
      'action_id': 6,
    },
    // {
    //   'leading': Icon(Icons.logout, color: Color.fromARGB(255, 6, 197, 223)),
    //   'title': 'Cerrar Sesión',
    //   'action_id': 6,
    // },
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
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 2) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const colaboradoresScreen(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 3) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const EncontradasScreen(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 4) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AnunciosDemo(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 5) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FraseScreen(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 6) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const contactoScreen(),
                        ),
                      );
                      // } else if (sideMenuData['action_id'] == 6) {
                      //   authService.cerrarSesion();
                      //   Navigator.pushAndRemoveUntil(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => const TabLoginScreen(),
                      //       ),
                      //       (route) => false);
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
