import 'package:buscappme/widgets/widget_personas.dart';
import 'package:flutter/material.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class PersonasPage extends StatefulWidget {
  const PersonasPage({super.key});

  @override
  State<PersonasPage> createState() => _PersonasPageState();
}

class _PersonasPageState extends State<PersonasPage> {
  late Controller controller;

  final List<dynamic> data = [
    {
      'img':
          'https://cdn.pixabay.com/photo/2020/12/29/15/33/musica-5870849_960_720.jpg',
      'title': 'MARÍA SANCHEZ (LIMA)',
      'subtitle': '25 días que estaba desaparecida',
      'content':
          'María Pilar Sanchez Carrión de 22 años, fue encontrada por Doña Cecilia Gomez quien vende fruta en el mercado que esta ubicado en la av.Canta Callao con Santa Rosa a las 11 de la mañana. Pues Doña Cecilia vio el post publicado hace unas semanas atrás y reconoció a la joven que no sabía donde estaba. La joven con autismo de tercer nivel ya se encuentra con sus familiares.'
    },
    {
      'img':
          'https://static.guiainfantil.com/media/31278/c/cuando-el-nino-de-3-anos-no-habla-md.jpg',
      'title': 'ADOLFO CERRON (PIURA)',
      'subtitle': '20 días que estaba desaparecido',
      'content':
          'Adolfo Paco Cerrón Castillo de 9 años, fue encontrado por Don Josue Canto quien es mecanico y trabaja en la Av.Prolg. Grau Mz N Lt 01 AAHH Las Capullanas- Dist. 26 de Octubre a las 6 de la tarde. Pues Don Josue vio el post publicado hace unas semanas atrás y reconoció al menor que estaba llorando. El menor ya se encuentra con sus familiares.'
    },
    {
      'img':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Lautaro_Naim.jpg/800px-Lautaro_Naim.jpg',
      'title': 'MARIO SIERRA (LA LIBERTAD)',
      'subtitle': '40 días que estaba desaparecido',
      'content':
          'Mario Marlon Sierra Castañeda de 20 años, fue encontrado por una pareja de esposos que disfrutaban su viaje cerca a la Carretera Panamericana Km.558-Trujillo a las 9 de la mañana. Pues la pareja vio el post publicado hace unas semanas atrás y reconocieron al joven que estaba tirado en el piso. El joven ya se encuentra con sus familiares.'
    },
    {
      'img':
          'https://eresmama.com/wp-content/uploads/2019/06/chico-adolescente-500x333.jpg',
      'title': 'JULIO ESPINOZA (SAN MARTÍN)',
      'subtitle': '22 días que estaba desaparecido',
      'content':
          'Julio Gaspar Espinoza Tello de 12 años, fue encontrado por Doña Pierina Salas quien labora cerca a la Jr. Tarapoto N° 116 Plaza de Armas, Tarapoto a las 6 de la mañana. Pues Doña Pierina  vio el post publicado hace unas semanas atrás y reconoció al menor que no sabía donde estaba. El menor ya se encuentra con sus familiares.'
    },
    {
      'img':
          'https://img.freepik.com/foto-gratis/retrato-adolescente-masculino-sonriente_171337-893.jpg',
      'title': 'JAIR TORRES (LIMA)',
      'subtitle': '37 días que estaba desaparecido',
      'content':
          'Jair Fabian Torres Sanchez de 15 años, fue encontrado por Don Ramón Piedra quien estaba de guardia en maxiahorro que esta ubicado en la av.Prolongación Iquitos 1850-Lince a las 8 de la noche. Pues Don Ramón vio el post publicado hace unas semanas atrás y reconoció al adolescente que estaba en in rincón de la tienda. El adolescente con autismo de segundo nivel ya se encuentra con sus familiares.'
    },
    {
      'img':
          'https://st2.depositphotos.com/2313461/6715/i/600/depositphotos_67157103-stock-photo-portrait-of-a-cunning-teenage.jpg',
      'title': 'JOSÉ PASTOR (ANCASH)',
      'subtitle': '17 días que estaba desaparecido',
      'content':
          'José Jesús Pastor Carrera de 14 años, fue encontrado por Don Guillermo Lopéz quien paseaba por Jr. Independencia cuadra 2 frente al banco de la nacion-Chimbote a las 1 de la tarde. Pues Don Guillermo vio el post publicado hace unas semanas atrás y reconoció al adolescente que pedía limosna. El adolescente ya se encuentra con sus familiares.'
    },
    {
      'img': 'https://upload.wikimedia.org/wikipedia/commons/e/e0/Anciano.JPG',
      'title': 'LEONARDO PEREZ (UCAYALI)',
      'subtitle': '40 días que estaba desaparecido',
      'content':
          'Leonardo Sergio Perez Cabeza de 72 años, fue encontrado por Doña Luisa Garrido quien trabaja en el banco que esta ubicado en la Av. Aguaytia  N° 561, Pucallpa a las 3 de la tarde. Pues Doña Luisa vio el post publicado hace unas semanas atrás y reconoció al anciano que no sabía donde estaba. El anciano con alzheimer ya se encuentra con sus familiares.'
    },
    {
      'img':
          'https://medipense.com/es/wp-content/uploads/sites/3/2020/04/Better-residences-Seniors.jpg',
      'title': 'JOEL Y MIRANDA FLORES (ICA)',
      'subtitle': '50 días que estaba desaparecido',
      'content':
          'Joel Mario Flores Mamachay y Miranda Lourdes Flores Mamachay de 56 años, fueron encontrados por una enfermera quien estaba haciendo una campaña de vacunación en Jr. Huascar Mz 43 Lt 01 a las 10 de la mañana. Pues la enfermera vio el post publicado hace unas semanas atrás y reconoció a los mellizos que estaban sentados en una banca. Los mellizos ya se encuentra con sus familiares.'
    },
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQolAmPkm61yI2NGLOiht2_XDkpOzGGLy24-w&usqp=CAU',
      'title': 'ZORAIDA FRANCOIS(PUNO)',
      'subtitle': '28 días que estaba desaparecida',
      'content':
          'Zoraida Camila Francois Pilares de 70 años, fue encontrada por Doña Modesta Gomez quien vende fruta en la tienda que esta ubicado en la Plaza de Armas S/N - Palacio Municipal de Acora a las 2 de la tarde. Pues Doña Modesta vio el post publicado hace unas semanas atrás y reconoció a la anciana que no sabía donde estaba. La anciana ya se encuentra con sus familiares.'
    },
    {
      'img':
          'https://cdn2.salud180.com/sites/default/files/styles/large/public/field/image/2020/03/estas_son_las_caracteristicas_que_vuelven_a_una_mujer_irresistible_segun_ellos.jpg',
      'title': 'SAORI CRISPIN (HUANCAYO)',
      'subtitle': '22 días que estaba desaparecida',
      'content':
          'Saori Pilar Crispin Carrión de 28 años, fue encontrada por un grupo de amigas que paseaban por la Av. Ricardo Palma S/N, Junín a las 9 de la mañana. Pues las amigas vieron el post publicado hace unas semanas atrás y reconocieron a la joven que dormía en una banca. La joven que perdió la memoria ya se encuentra con sus familiares.'
    },
    {
      'img':
          'https://images.ecestaticos.com/Z9ARVvCrla9aQGl1NtpXfB1WBHQ=/484x270:5299x3536/1200x1200/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2Fb0d%2F0c8%2F01d%2Fb0d0c801d29a3fc13d9ec30ef361d0cf.jpg',
      'title': 'MIQUEILA ROSAS(INDIA)',
      'subtitle': '15 días que estaba desaparecida',
      'content':
          'Miqueila Rosita Rosas Paredes de 34 años, fue encontrada por un serenazgo que patrullaba la zona de Lince a las 10 de la noche. Pues el joven sereno vio el post publicado hace unas semanas atrás y reconoció a la joven quien dormía en el parque. La joven con sordera ya se encuentra con sus familiares.'
    }
  ];

  Controller? testingController;

  @override
  void initState() {
    controller = testingController ?? Controller()
      ..addListener((event) {
        _handleCallbackEvent(event.direction, event.success);
      });
    super.initState();
  }

  void _handleCallbackEvent(ScrollDirection direction, ScrollSuccess success,
      {int? currentIndex}) {
    print(
        "Scroll callback received with data: {direction: $direction, success: $success and index: ${currentIndex ?? 'not given'}}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personas encontradas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 248, 248, 248),
          ),
        ),
        centerTitle: true,
      ),
      body: TikTokStyleFullPageScroller(
          contentSize: data.length,
          swipePositionThreshold: 0.2,
          swipeVelocityThreshold: 2000,
          animationDuration: const Duration(milliseconds: 400),
          controller: controller,
          builder: (BuildContext context, int index) {
            final sitios = data[index];

            return PersonasWidget(
              img: sitios['img'],
              title: sitios['title'],
              subtitle: sitios['subtitle'],
              content: sitios['content'],
            );
          }),
    );
  }
}
