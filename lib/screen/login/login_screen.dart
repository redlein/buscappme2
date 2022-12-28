
import 'package:buscappme/index_main.dart';
import 'package:buscappme/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:buscappme/domain/providers/login_provider.dart';
import 'package:buscappme/domain/services/index_services.dart';

import 'package:buscappme/widgets/login_input.dart';
import 'package:buscappme/routes/routes.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final TextEditingController controllerCorreo = TextEditingController();
    
    return SingleChildScrollView(
      child: SizedBox(
        child: Form(
          key: loginProvider.formkey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                LoginInput(controller: controllerCorreo, input: 'email', hintText: 'Correo@electrónico.com'),
                const SizedBox(
                  height: 10,
                ),
                const LoginInput(controller: null, input: 'password', hintText: 'Password'),
                const SizedBox(
                  height: 30,
                ),
                // Botón
                SizedBox(
                  height: 50,
                  width: 200,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    disabledColor: ColorsPanel.cBase,
                    elevation: 1,
                    color: ColorsPanel.cBase,
                    onPressed: loginProvider.isLoading ? null : () async {

                      final authService = Provider.of<AuthService>(context, listen: false);
                      if (!loginProvider.isValidForm()) return;
                      loginProvider.isLoading = true;

                      dynamic response = await authService.login(
                        loginProvider.email,
                        loginProvider.password,
                      );

                      if (response != null) {
                        SnackbarService.verSnackbar( 'Correo y/o contraseña inválido');
                        loginProvider.isLoading = false;
                        return;
                      }

                      response = await authService.getUsuarioSupabase(
                        loginProvider.email
                      );

                      loginProvider.nombres = response['nombre'];
                      loginProvider.apellidos = response['apellidos'];
                      loginProvider.phone = response['telefono'];
                      loginProvider.tipoUsuario = response['tipo_usuario'];

                      Preferences.email = loginProvider.email;
                      Preferences.name = loginProvider.nombres;
                      Preferences.lastname = loginProvider.apellidos;
                      Preferences.number = loginProvider.phone;
                      Preferences.tipoUsuario = loginProvider.tipoUsuario;

                      Navigator.pushReplacementNamed( context, MyRoutes.rHOME);
                    },
                    child: loginProvider.isLoading ? const CircularProgressIndicator(
                      color: Colors.white,
                    ) 
                    : const Text(
                      'Ingresar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
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