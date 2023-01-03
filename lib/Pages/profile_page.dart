import 'dart:io';

import 'package:buscappme/Pages/index_page.dart';
import 'package:buscappme/util/color_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;
  final picker = ImagePicker();

  @override
  void initState() {
    Preferences.img2.isNotEmpty ? image = File(Preferences.img2) : image = null;
    super.initState();
  }

  Future selimagen(op) async {
    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    }

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        Preferences.img2 = pickedFile.path;
      } else {
        print('No seleccionó una foto');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Path user image: ${Preferences.img2}');
    final authService = Provider.of<AuthService>(context, listen: false);
    const urlImage =
        'https://images.unsplash.com/photo-1605379399642-870262d3d051?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1506&q=80';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              //Photo, name and button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        image != null //image
                            ? Container(
                                width: 120,
                                height: 120,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orange.shade100,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.file(
                                    image!,
                                    fit: BoxFit.cover,
                                    width: 120,
                                    height: 120,
                                  ),
                                ),
                              )
                            :

                            //Image.file(image!):
                            // const CircleAvatar(
                            //   radius: 60,
                            //   backgroundImage: NetworkImage(urlImage),
                            // ),
                            Container(
                                width: 120,
                                height: 120,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orange.shade100,
                                ),
                                // child: Text(
                                //   '${Preferences.name[0]}${Preferences.lastname[0]}',
                                //   style: GoogleFonts.poppins(
                                //       fontSize: 40,
                                //       fontWeight: FontWeight.w500),
                                // ),
                              ),
                        Positioned(
                          bottom: 1,
                          right: 1,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  // <-- for border radius
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                builder: (context) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 45,
                                          height: 5,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 15.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                      _CustomListTitle(
                                        title: 'Elegir de la biblioteca',
                                        leading: const Icon(
                                          FontAwesomeIcons.solidFileImage,
                                          color: Colors.black,
                                        ),
                                        onTap: () {
                                          //Preferences.img2 = image.toString();

                                          selimagen(1);
                                        },
                                      ),
                                      //const SizedBox(height: 15.0),
                                      _CustomListTitle(
                                        title: 'Tomar foto',
                                        leading: const Icon(
                                          FontAwesomeIcons.camera,
                                          color: Colors.grey,
                                        ),
                                        onTap: () {
                                          //Preferences.img2 = image.toString();

                                          selimagen(2);
                                        },
                                      ),
                                      const SizedBox(height: 20.0),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.black,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 30.0),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${Preferences.name} ${Preferences.lastname}',
                              style: GoogleFonts.poppins(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              Preferences.email,
                              style: GoogleFonts.poppins(
                                  fontSize: 17, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 20.0),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    // <-- for border radius
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  builder: (context) => Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom,
                                        left: 20.0,
                                        right: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Center(
                                          child: Container(
                                            width: 45,
                                            height: 5,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20.0),
                                        Text(
                                          'Editar número de celular',
                                          style: GoogleFonts.poppins(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        ),

                                        const SizedBox(height: 10.0),
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                //color: Color.fromARGB(255, 248, 248, 248),
                                                color: Theme.of(context)
                                                    .shadowColor,
                                                offset: const Offset(0.0, 2.0),
                                                blurRadius:
                                                    Preferences.theme == false
                                                        ? 20.0
                                                        : 3.0,
                                              )
                                            ],
                                          ),
                                          child: TextFormField(
                                            style: GoogleFonts.poppins(
                                                color: Colors.black),
                                            autocorrect: false,
                                            keyboardType: TextInputType.number,
                                            maxLength: 9,
                                            cursorColor: ColorsPanel.cBase,
                                            decoration: _customInputDecoration(
                                              hintText: 'Número de celular',
                                              prefixIcon: const Icon(
                                                Icons.phone_android_outlined,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            onChanged: (value) {
                                              Preferences.number = value;
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: 20.0),
                                        //Button
                                        MaterialButton(
                                          minWidth: double.infinity,
                                          height: 60,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          onPressed: () {
                                            setState(() {});
                                          },
                                          color: ColorsPanel.cBase,
                                          child: Text(
                                            'Actualizar',
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20.0),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 150,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: ColorsPanel.cBase,
                                ),
                                child: Text(
                                  'Editar perfil',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                decoration: BoxDecoration(
                  //color: Colors.white,
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      //color: Color.fromARGB(255, 248, 248, 248),
                      color: Theme.of(context).shadowColor,
                      offset: const Offset(0.0, 2.0),
                      blurRadius: Preferences.theme == false ? 20.0 : 3.0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    _CustomListTitle(
                      title: Preferences.name,
                      leading: const Icon(
                        Icons.abc,
                        color: Colors.grey,
                      ),
                      onTap: () {},
                    ),
                    _CustomListTitle(
                      title: Preferences.lastname,
                      leading: const Icon(
                        Icons.abc,
                        color: Colors.grey,
                      ),
                      onTap: () {},
                    ),
                    _CustomListTitle(
                      title: Preferences.number.isEmpty
                          ? '-------'
                          : Preferences.number,
                      leading: const Icon(
                        Icons.phone_android,
                        color: Colors.grey,
                      ),
                      onTap: () {},
                    ),
                    _CustomListTitle(
                      title: Preferences.email,
                      leading: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      //color: Color.fromARGB(255, 248, 248, 248),
                      color: Theme.of(context).shadowColor,
                      offset: const Offset(0.0, 2.0),
                      blurRadius: Preferences.theme == false ? 20.0 : 3.0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    _CustomListTitle(
                      title: 'Modo oscuro',
                      leading: const Icon(
                        Icons.dark_mode,
                        color: Colors.grey,
                      ),
                      onTap: () {},
                      trailing: CupertinoSwitch(
                        value: Preferences.theme,
                        onChanged: (value) {
                          Preferences.theme = value;
                          final themeProvider = Provider.of<ThemeProvider>(
                              context,
                              listen: false);

                          value
                              ? themeProvider.setOscuro()
                              : themeProvider.setClaro();
                          setState(() {});
                        },
                      ),
                    ),
                    // _CustomListTitle(
                    //   title: 'Ayuda',
                    //   leading: const Icon(
                    //     Icons.help,
                    //     color: Colors.grey,
                    //   ),
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         CupertinoPageRoute(
                    //           builder: (context) => const SupportPage(),
                    //         ));
                    //   },
                    //   trailing: const Icon(
                    //     Icons.keyboard_arrow_right_rounded,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    _CustomListTitle(
                      title: 'Visita nuestra web',
                      leading: const Icon(
                        Icons.web,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PrivacyPoliciesPage(),
                            ));
                      },
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      //color: Color.fromARGB(255, 248, 248, 248),
                      color: Theme.of(context).shadowColor,
                      offset: Offset(0.0, 2.0),
                      blurRadius: Preferences.theme == false ? 20.0 : 3.0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    _CustomListTitle(
                      title: 'Limpiar cache',
                      leading: const Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey,
                      ),
                      onTap: () {},
                    ),
                    _CustomListTitle(
                      title: 'Cerrar sesión',
                      leading: Icon(
                        Icons.exit_to_app,
                        color: ColorsPanel.cYellow,
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey,
                      ),
                      onTap: () async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        await preferences.clear();
                        authService.cerrarSesion();
                        //Navigator.pushReplacementNamed(context, MyRoutes.rLogin);

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OnboardingPage(),
                            ),
                            (route) => false);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  final String title;
  final Widget leading;
  final Widget? trailing;
  final Function() onTap;

  const _CustomListTitle({
    required this.title,
    required this.leading,
    this.trailing,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}

InputDecoration _customInputDecoration({
  final String? hintText,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: GoogleFonts.poppins(color: Colors.grey),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.all(20.0),
  );
}
