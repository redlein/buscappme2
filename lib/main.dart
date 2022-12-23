import 'package:buscappme/domain/providers/storage_provider.dart';
import 'package:buscappme/domain/providers/theme_provider.dart';
import 'package:buscappme/domain/services/busqueda_service.dart';
// import 'package:buscappme/onboarding/onboarding_page.dart';
import 'package:buscappme/preferences/preferences.dart';
import 'package:buscappme/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buscappme/domain/services/snackbar_service.dart';
import 'package:buscappme/domain/providers/login_provider.dart';
import 'domain/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkMode: Preferences.theme),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (_) => StorageImageProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BusquedaService(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      scaffoldMessengerKey: SnackbarService.msgkey,
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: MyRoutes.rVERIFY,
      // home: const OnboardingPage(),
    );
  }
}
