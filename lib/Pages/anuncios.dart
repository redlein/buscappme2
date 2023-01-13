import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnunciosDemo extends StatelessWidget {
  const AnunciosDemo({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 20, left: 28.8),
              child: Text(
                'Realiza una donación',
                style: GoogleFonts.playfairDisplay(
                    fontSize: 45, fontWeight: FontWeight.w700),
              )),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  bottom: const TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Color.fromARGB(255, 124, 122, 122),
                    // labelStyle: GoogleFonts.lato(fontWeight: FontWeight.w700),
                    indicatorColor: Colors.amber,
                    tabs: [
                      Tab(
                        text: 'YaPe',
                      ),
                      Tab(
                        text: 'PayPal',
                      ),
                      Tab(
                        text: 'Patreon',
                      ),
                    ],
                  ),
                  // title: const Text('Tabs Demo'),
                ),
                body: const TabBarView(
                  children: [
                    Image(image: AssetImage('assets/yape1.png')),
                    Image(image: AssetImage('assets/paypal1.png')),
                    Image(image: AssetImage('assets/patreon1.png')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}