import 'package:flutter/material.dart';

class PersonasWidget extends StatelessWidget {
  final String? img;
  final String? title;
  final String? subtitle;
  final String? content;

  const PersonasWidget(
      {super.key, this.img, this.title, this.subtitle,  this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        SizedBox(
            width: 300,
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
              child: Image.network(
                '$img',
                fit: BoxFit.cover,
              ),
            )),
        const SizedBox(
          height: 0,
        ),
        Container(
          height: 100,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(170, 170, 170, 170),
                // offset: Offset(6, 6),
                blurRadius: 10,
              ),
            ],
          ),


          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text( 
                        '$title', 
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '$subtitle',
                        style: const TextStyle(
                          fontSize: 12,
                          height: 1.5,
                          color: Colors.black,
                        ),
                      ),

                      
                    ],
                  ),
                ),
              ],
            ),
          ),

        ),




        const SizedBox(
          height: 10,
        ),

        Container(
          margin: const EdgeInsets.all(30),
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              const BoxShadow(
                color: Color.fromARGB(170, 160, 160, 160),
                // offset: Offset(-6, 6),
                blurRadius: 10,
              ),
            ],
          ),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                child: Text(
                  '$content',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
