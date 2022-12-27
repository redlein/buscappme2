import 'package:buscappme/domain/providers/login_provider.dart';
import 'package:buscappme/screen/login/login_screen.dart';
import 'package:buscappme/screen/login/register_screen.dart';
import 'package:buscappme/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabLoginScreen extends StatelessWidget {
  const TabLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: ColorsPanel.cYellow,
              toolbarHeight: 250,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: CircleAvatar(
                      radius: 128,
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
              ),

              // Cabeceras de TabBar
              bottom: const TabBar(
                isScrollable: false,
                tabs: [
                  Tab(
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Registrarse',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: GestureDetector(
                onTap: () {
                  final FocusScopeNode focus = FocusScope.of(context);
                  if (!focus.hasPrimaryFocus && focus.hasFocus) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  }
                },
                child: TabBarView(children: <Widget>[
                  ChangeNotifierProvider(
                    create: (context) => LoginProvider(),
                    child: const LoginScreen(),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => LoginProvider(),
                    child: const RegisterScreen(),
                  )
                ]))));
  }
}
