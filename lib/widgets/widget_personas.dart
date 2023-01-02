import 'package:flutter/material.dart';

class PersonasWidget extends StatelessWidget {
  final String? img;
  final String? title;
  final String? subtitle;
  final String? content;

  const PersonasWidget(
      {super.key, this.img, this.title, this.subtitle, this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            width: 300,
            height: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                '$img',
                fit: BoxFit.fill,
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xAA6EB1E6),
                offset: Offset(6, 6),
                blurRadius: 6,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('$subtitle'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(30),
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [
                Colors.orange,
                Colors.yellow,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.25, 0.90],
            ),
            boxShadow: [
              const BoxShadow(
                color: Color(0xFF101012),
                offset: Offset(-12, 12),
                blurRadius: 8,
              ),
            ],
          ),
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                child: Text(
                  '$content',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
