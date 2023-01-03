import 'package:buscappme/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode
            ? ThemeData(
                useMaterial3: true,
                colorScheme: const ColorScheme.dark(),
                scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
                backgroundColor: const Color(0xff252836),
                shadowColor: const Color.fromARGB(24, 46, 46, 46),
                textTheme: TextTheme(
                  headline1: GoogleFonts.poppins(color: Colors.white),
                ),
                textSelectionTheme: const TextSelectionThemeData(
                  selectionHandleColor: Colors.blue,
                ),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color(0xff252836),
                ),
              )
            : ThemeData(
                useMaterial3: true,
                colorScheme: const ColorScheme.light(),
                scaffoldBackgroundColor:
                    const Color.fromARGB(255, 240, 244, 255),
                backgroundColor: ColorsPanel.cGrey,
                shadowColor: const Color.fromARGB(255, 248, 248, 248),
                textTheme: TextTheme(
                  headline1: GoogleFonts.poppins(color: Colors.black),
                ),
                textSelectionTheme: const TextSelectionThemeData(
                  selectionHandleColor: Colors.blue,
                ),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                ),
              );

  setClaro() {
    currentTheme = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(),
      scaffoldBackgroundColor: const Color.fromARGB(255, 240, 244, 255),
      backgroundColor: Colors.white,
      shadowColor: const Color.fromARGB(255, 248, 248, 248),
      textTheme: TextTheme(
        headline1: GoogleFonts.poppins(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: Colors.blue,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
    );

    notifyListeners();
  }

  setOscuro() {
    currentTheme = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(),
      scaffoldBackgroundColor: const Color(0xff1f1d2b),
      backgroundColor: const Color(0xff252836),
      shadowColor: const Color.fromARGB(24, 46, 46, 46),
      textTheme: TextTheme(
        headline1: GoogleFonts.poppins(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: Colors.blue,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff252836),
      ),
    );

    notifyListeners();
  }
}
