import 'package:buscappme/domain/services/index_services.dart';
import 'package:buscappme/index_main.dart';
import 'package:buscappme/util/color_util.dart';
import 'package:buscappme/widgets/login_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterscreenV2 extends StatelessWidget {
  const RegisterscreenV2({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final TextEditingController controllerCorreo = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff040714),
        leading: BackButton(
          color: Colors.white
        ), 
      ),
      backgroundColor: const Color(0xff040714),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: loginProvider.formRegisterkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 200,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
                const SizedBox( height: 10 ),
                const Text(
                  'Regístrate',
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox( height: 10 ),
                LoginInput(
                    controller: controllerCorreo,
                    input: 'email',
                    hintText: 'Correo@electrónico.com'),
                const SizedBox(
                  height: 10,
                ),
                const LoginInput(
                    controller: null, input: 'password', hintText: 'Password'),
                const SizedBox(height: 10),
                const LoginInput(
                    controller: null, input: 'nombres', hintText: 'Nombres'),
                const SizedBox(height: 10),
                const LoginInput(
                    controller: null,
                    input: 'apellidos',
                    hintText: 'Apellidos'),
                const SizedBox(height: 10),
                const LoginInput(
                    controller: null, input: 'phone', hintText: 'Teléfono'),
                const SizedBox(
                  height: 30,
                ),
                // Botón
                Center(
                  // height: 50,
                  // width: 200,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 50,
                    disabledColor: ColorsPanel.cBase,
                    elevation: 0,
                    color: ColorsPanel.cBase,
                    onPressed: loginProvider.isLoading ? null : () async {
                      final authService = Provider.of<AuthService>(
                          context,
                          listen: false);
                      if (!loginProvider.isValidForm()) return;
                      loginProvider.isLoading = true;

                      dynamic response = await authService.createUser(
                        loginProvider.email,
                        loginProvider.password,
                      );

                      if (!response.containsKey('idToken')) {
                        SnackbarService.verSnackbar(
                            'Correo y/o contraseña inválido');
                        loginProvider.isLoading = false;
                        return;
                      }

                      response = await authService.createUserSupabase(
                          loginProvider.email,
                          loginProvider.nombres,
                          loginProvider.apellidos,
                          loginProvider.phone);

                      if (response != null) {
                        SnackbarService.verSnackbar(response);
                        loginProvider.isLoading = false;
                        return;
                      }
                      loginProvider.isLoading = false;

                      Preferences.email = loginProvider.email;
                      Preferences.name = loginProvider.nombres;
                      Preferences.lastname = loginProvider.apellidos;
                      Preferences.number = loginProvider.phone;
                      Preferences.tipoUsuario = 0;

                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacementNamed(
                          context, MyRoutes.rHOME);
                    },
                    child: loginProvider.isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                      'Registrarse',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}