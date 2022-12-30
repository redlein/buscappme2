import 'package:buscappme/Pages/splash.dart';
import 'package:buscappme/index_main.dart';
import 'package:buscappme/screen/login/verify_auth_screen.dart';
import 'domain/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ),
        ChangeNotifierProvider(
          create: (context) => ChangeProvider(),
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
      // initialRoute: MyRoutes.rVERIFY,
      // home: const OnboardingPage(),
      initialRoute: '/splash',
      routes: {
        '/': (_) => const VerifyAuthScreen(),
        '/splash': (_) => const SplashPage()
      },
    );
  }
}
