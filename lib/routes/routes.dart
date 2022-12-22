import 'package:buscappme/onboarding/onboarding_page.dart';
import 'package:buscappme/screen/busquedas/listar_busquedas_screen.dart';
import 'package:flutter/material.dart';
import 'package:buscappme/screen/index_screens.dart';

class MyRoutes {
  static const String rONBOARDING = '/onboarding';
  static const String rLOGIN = '/login';
  static const String rVERIFY = '/verify';
  static const String rHOME = '/home';
  static const String rPUBLICARBUSQUEDA = '/publicar_busqueda';
  static const String rLISTARBUSQUEDA = '/listar_busquedas';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/onboarding'):
        return MaterialPageRoute(builder: (context) => const OnboardingPage());

      case ('/verify'):
        return MaterialPageRoute(
            builder: (context) => const VerifyAuthScreen());

      case ('/login'):
        return MaterialPageRoute(builder: (context) => const TabLoginScreen());

      case ('/home'):
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case ('/publicar_busqueda'):
        return MaterialPageRoute(builder: (context) => const PublicarBusquedaScreen());

      case ('/listar_busquedas'):
        return MaterialPageRoute(builder: (context) => const ListarBusquedasScreen());

      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }
}
