
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
                LoginInput(controller: controllerCorreo, input: 'email'),
                const SizedBox(
                  height: 10,
                ),
                const LoginInput(controller: null, input: 'password'),
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
                    disabledColor: Colors.blue,
                    elevation: 1,
                    color: Colors.blue,
                    onPressed: loginProvider.isLoading ? null : () async {

                      final authService = Provider.of<AuthService>(context, listen: false);
                      if (!loginProvider.isValidForm()) return;
                      loginProvider.isLoading = true;

                      final String? errorMessage = await authService.login(
                        loginProvider.email,
                        loginProvider.password,
                      );

                      if (errorMessage != null) {
                        SnackbarService.verSnackbar( 'Correo y/o contraseña inválido');
                        loginProvider.isLoading = false;
                        return;
                      }

                      // ignore: use_build_context_synchronously
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