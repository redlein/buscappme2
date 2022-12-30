import 'package:buscappme/Pages/personas_page.dart';
import 'package:buscappme/Pages/profile_page.dart';
import 'package:buscappme/index_main.dart';
import 'package:buscappme/screen/drawer/index_drawer.dart';
import 'package:buscappme/Pages/contactoscreen.dart';
import 'package:buscappme/Pages/colaboradoresScreen.dart';
import 'package:buscappme/util/color_util.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key}) {
    if (Preferences.tipoUsuario == 1) {
      drawerMenuListname.add({
        'leading': Icon(
          Icons.person_pin,
          color: ColorsPanel.cSkyBlue,
        ),
        'title': 'Personas desaparecidas',
        'action_id': 7,
        'trailing': Icon(Icons.chevron_right),
      });
    }
  }

  final List drawerMenuListname = [
    {
      'leading': Icon(
        Icons.person_pin,
        color: ColorsPanel.cSkyBlue,
      ),
      'title': 'Perfil',
      'trailing': Icon(
        Icons.chevron_right,
      ),
      'action_id': 1,
    },
    {
      'leading': Icon(
        Icons.person,
        color: ColorsPanel.cSkyBlue,
      ),
      'title': 'Personas Encontradas',
      'trailing': Icon(
        Icons.chevron_right,
      ),
      'action_id': 2,
    },
    {
      'leading': Icon(
        Icons.perm_contact_calendar_outlined,
        color: ColorsPanel.cSkyBlue,
      ),
      'title': 'Colaboradores',
      'trailing': Icon(Icons.chevron_right),
      'action_id': 3,
    },
    {
      'leading': Icon(
        Icons.assignment_turned_in,
        color: ColorsPanel.cSkyBlue,
      ),
      'title': 'Anuncios',
      'trailing': Icon(Icons.chevron_right),
      'action_id': 4,
    },
    {
      'leading': Icon(
        Icons.star_rate_rounded,
        color: ColorsPanel.cSkyBlue,
      ),
      'title': 'Frase del Día',
      'trailing': Icon(Icons.chevron_right),
      'action_id': 5,
    },
    {
      'leading': Icon(
        Icons.contact_mail_outlined,
        color: ColorsPanel.cSkyBlue,
      ),
      'title': 'Contacto',
      'trailing': Icon(
        Icons.chevron_right,
      ),
      'action_id': 6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 260,
        child: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: SizedBox(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/logo.png'),
                  ),
                ),
                title: Text(
                  'Buscappme',
                  style: TextStyle(
                    color: ColorsPanel.cSkyBlue,
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
                    } else if (sideMenuData['action_id'] == 3) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const colaboradoresScreen(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 2) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PersonasPage(),
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
                    } else if (sideMenuData['action_id'] == 7) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ListarBusquedasScreen(),
                        ),
                      );
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
