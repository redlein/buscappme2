import 'package:buscappme/screen/index_screens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

int numberText = 0;

final styleTextTitle = GoogleFonts.meriendaOne(
  fontSize: 25,
  fontWeight: FontWeight.w900,
  height: 1,
);

final styleTextSubTitle = GoogleFonts.lora(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: const Color.fromARGB(255, 46, 2, 243),
  height: 1,
);

final List<dynamic> texts = [
  {
    "title": 'Busca a personas',
    "subtitle": "Buscappme te ayuda a encontrar a esa persona que se perdió.",
    "img": 'assets/buscar.jpg',
  },
  {
    "title": 'Ayuda continua',
    "subtitle": "Busca, encuentra y ayuda a otras personas.",
    "img": 'assets/ayudar.jpg',
  },
  {
    "title": 'Devuelve la sonrisa',
    "subtitle": "Ayuda a que se reúnan con sus seres queridos.",
    "img": 'assets/feliz.jpg',
  },
];

const primaryColor = Color.fromARGB(255, 57, 5, 199);

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 18, 5, 202),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TabLoginScreen(),
                      ));
                  // Navigator.pushReplacementNamed(context, MyRoutes.rLOGIN);
                },
                child: Text(
                  'OMITIR',
                  style: GoogleFonts.lora(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Texts slider
          SizedBox(
            height: sizeHeight * 0.7,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  numberText = value;
                });
              },
              itemCount: texts.length,
              itemBuilder: (context, index) {
                final texto = texts[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Image.asset(texto['img']),
                      const SizedBox(height: 20.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: Text(
                          texto['title'],
                          style: styleTextTitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        texto['subtitle'],
                        style: styleTextSubTitle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          //Circle animation indicator
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  texts.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: numberText == index
                          ? primaryColor
                          : const Color.fromARGB(255, 248, 232, 4),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
