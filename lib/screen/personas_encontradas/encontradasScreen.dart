import 'package:buscappme/domain/providers/change_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class EncontradasScreen extends StatelessWidget {
  const EncontradasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List personas = [
      'https://estudiantes.ucontinental.edu.pe/wp-content/uploads/2020/09/Madurez-emocional-7.jpg',
      'https://cdn.pixabay.com/photo/2018/05/01/16/19/young-man-3366016_960_720.jpg',
      'https://media.istockphoto.com/id/1155093653/es/foto/retrato-de-joven-sonriente-en-la-calle.jpg?s=612x612&w=0&k=20&c=tAsN9-KqzXTtFSGkloNM7OOw590vZyM7buUtuT9CMls=',
      'https://www.shutterstock.com/image-photo/halfbody-portraits-5yearold-boy-posing-260nw-1853102278.jpg',
      'https://www.shutterstock.com/image-photo/portrait-happy-joyful-laughing-beautiful-260nw-126071342.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/e/e0/Anciano.JPG',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc0xgxtQjDQAt3TPpfRCoTBjLQM7Lp-cSwKwXsjWfAiEGTRHzS1Zearxbaik7egN3DVd8&usqp=CAU',
      'https://cloudfront-us-east-1.images.arcpublishing.com/eluniverso/FDS2SF5WH5CMHJUZC44LB2IJNU.webp',
    ];

    final cambio = Provider.of<ChangeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: (cambio.datoT == false)
            ? const Text(
                'A Celebrar!!!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color.fromARGB(255, 253, 253, 253),
                ),
              )
            : const Text(
                'Personas Encontradas',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 253, 253, 253),
                ),
              ),
        actions: [
          Switch(
            value: cambio.datoT,
            onChanged: (value) {
              cambio.cambiarT(value);
              cambio.btnMostrarAlerta();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Streamer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Nuestra Streamer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 38, 4, 190),
                    ),
                  ),
                ),
                Switch(
                  value: cambio.dato,
                  onChanged: (value) {
                    cambio.cambiar(value);
                    cambio.btnMostrarAlerta();
                  },
                ),
              ],
            ),

            //Personas Encontradas título
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Personas Encontradas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 38, 4, 190),
                    ),
                  ),
                ),
                Switch(
                  value: cambio.dato2,
                  onChanged: (value) {
                    cambio.cambiar2(value);
                    cambio.btnMostrarAlerta();
                  },
                ),
              ],
            ),

            Visibility(
              visible: cambio.isEmpty,
              child: Lottie.network(
                  'https://assets8.lottiefiles.com/packages/lf20_nunbkpxg.json'),
            ),

            const SizedBox(height: 150.0),
            Visibility(
              visible: cambio.dato,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.network(
                  'https://sientetrujillo.com/wp-content/uploads/2022/02/Nela-caster-trujillana-Dota-2.jpg',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 150.0),

            //Lista de cenas
            Visibility(
              visible: cambio.dato2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Ya estan con sus familias',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color.fromARGB(255, 38, 4, 190),
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      itemCount: personas.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                personas[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.blue,
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Text('Personas $index'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
