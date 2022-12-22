import 'package:buscappme/domain/providers/login_provider.dart';
import 'package:buscappme/screen/login/login_screen.dart';
import 'package:buscappme/screen/login/register_screen.dart';
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
          backgroundColor: Colors.blue,
          toolbarHeight: 220,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              
            ),
          ),
          //
          // Cabeceras de TabBar
          bottom: const TabBar(
            isScrollable: false,
            tabs: [
              Tab(
                child: Text('Iniciar Sesión'),
              ),
              Tab(
                child: Text('Registrarse'),
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
          child: TabBarView(
            children: <Widget>[
              ChangeNotifierProvider(
                create: (context) => LoginProvider(),
                child: const LoginScreen(),
              ),
              ChangeNotifierProvider(
                create: (context) => LoginProvider(),
                child: const RegisterScreen(),
              )
            ]
          )
        )
      )
    );
  }
}