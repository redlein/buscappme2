import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import 'package:clipboard/clipboard.dart';
import 'package:http/http.dart' as http;
import 'package:tiktoklikescroller/controller.dart';

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
        Column(
          children: [
            const SizedBox(
              height: 20,
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
            // const SizedBox(
            //   height: 0,
            // ),
            Container(
              height: 107,
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

              // alignment: Alignment.center,
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
                              height: 2,
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

            // const SizedBox(
            //   height: 5,
            // ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(30),
          height: 300,
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
          
          // alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    child: Text(
                      '\n $content',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),  
                  ),


                  const SizedBox(
                   height: 15,
                     ),

                  Center(
                    child: Row(
                      children: [
                       

                        const SizedBox(
                          width: 42,
                           ),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Color.fromARGB(255, 45, 85, 154),
                          ),
                        onPressed: () async {
                          final urlImage =
                        '$img';

              final url = Uri.parse(urlImage);
              final response = await http.get(url);
              final bytes = response.bodyBytes;

              final temp = await getTemporaryDirectory();
              final path = '${temp.path}/image.jpg';
              File(path).writeAsBytesSync(bytes);
                          await Share.shareFiles(
                          [path],  
                          text: '$title \n $subtitle \n $content',
                          
                        );
                        },
                        child: const Text('Compartir'),
            ),

                  const SizedBox(
                   width: 25,
                     ),    

            
            ElevatedButton(
              style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Color.fromARGB(255, 45, 85, 154),
                          ),
                    onPressed: () async {
                      
                      await FlutterClipboard.copy('$title \n $subtitle \n $content');

                      void showSnackbar(BuildContext context){
                        final snackBar = SnackBar(content: Text('Copiaste la informaci??n'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      showSnackbar(context);


                    },
                    child: const Text('   Copiar   '),
            ),],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Divider(
            color: Colors.white,
            height: 4,
          ),
        )
      ],
    );
  }
}
