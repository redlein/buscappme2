import 'package:buscappme/screen/index_screens.dart';
import 'package:buscappme/screen/login/login_screen_v2.dart';
import 'package:buscappme/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);
 
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}
 
int numberText = 0;
 
final styleTextTitle = GoogleFonts.ptSans(
  fontSize: 30,
  fontWeight: FontWeight.w900,
  color: ColorsPanel.cBase,
  height: 1,
);
 
final styleTextSubTitle = GoogleFonts.lato(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 67, 68, 69),
  height: 1,
);
 
final List<dynamic> texts = [
  {
    "title": 'Busca a personas',
    "subtitle": "Te ayudamos a encontrar a esa persona que se perdió.",
    "img": 'assets/logo.png',
  },
  {
    "title": 'Ayuda continua',
    "subtitle": "Busca, encuentra y ayuda a otras personas.",
    "img": 'assets/ayudar1.png',
  },
  {
    "title": 'Devuelve la sonrisa',
    "subtitle": "Ayuda a que se reúnan con sus seres queridos.",
    "img": 'assets/felicidad.png',
  },
];
 
const primaryColor = Color.fromARGB(255, 57, 5, 199);
 
class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: ColorsPanel.cWhite,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreenV2(),
                      ));
                  // Navigator.pushReplacementNamed(context, MyRoutes.rLOGIN);
                },
                child: Text(
                  'OMITIR',
                  style: GoogleFonts.lora(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: ColorsPanel.cBlack,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Texts slider
            SizedBox(
              height: sizeHeight * 0.75,
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
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Container(
                            child: Image.asset(
                          texto['img'],
                          height: 350,
                        )),
                        const SizedBox(height: 20.0),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Container(
                            child: Text(
                              texto['title'],
                              style: styleTextTitle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text(
                            texto['subtitle'],
                            style: styleTextSubTitle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 50.0),

            //Circle animation indicator
            Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
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
                              ? ColorsPanel.cYellow
                              : ColorsPanel.cGrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}