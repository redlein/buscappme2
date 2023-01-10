import 'package:buscappme/domain/services/index_services.dart';
import 'package:buscappme/index_main.dart';
import 'package:buscappme/screen/index_screens.dart';
import 'package:buscappme/util/color_util.dart';
import 'package:buscappme/widgets/login_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreenV2 extends StatelessWidget {
  const LoginScreenV2({super.key});

   Widget _buildSignInWithText(context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 25.0),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
            ),
            onPressed: () {
              Navigator.push( context,
                MaterialPageRoute(
                  builder: (context) => const RegisterscreenV2(),
                )
              );
            },
            child: Text(
              '¿No tienes una cuenta? Regístrate',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final TextEditingController controllerCorreo = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff040714),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color(0xff040714),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: loginProvider.formkey,
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
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                LoginInput(
                  controller: controllerCorreo,
                  input: 'email',
                  hintText: 'Correo@electrónico.com'
                ),
                const SizedBox(
                  height: 10,
                ),
                const LoginInput(
                  controller: null, 
                  input: 'password', 
                  hintText: 'Password'
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 50,
                    // minWidth: double.infinity,
                    color: ColorsPanel.cBase,
                    elevation: 0,
                    child: loginProvider.isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                      'Ingresar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18  ,
                      ),
                    ),
                    onPressed: loginProvider.isLoading
                    ? null : () async {
                      final authService = Provider.of<AuthService>(
                          context,
                          listen: false);
                      if (!loginProvider.isValidForm()) return;
                      loginProvider.isLoading = true;
      
                      dynamic response = await authService.login(
                        loginProvider.email,
                        loginProvider.password,
                      );
      
                      if (response != null) {
                        SnackbarService.verSnackbar(
                            'Correo y/o contraseña inválido');
                        loginProvider.isLoading = false;
                        return;
                      }
      
                      response = await authService.getUsuarioSupabase(loginProvider.email);
      
                      loginProvider.nombres = response['nombre'];
                      loginProvider.apellidos = response['apellidos'];
                      loginProvider.phone = response['telefono'];
                      loginProvider.tipoUsuario = response['tipo_usuario'];

                      loginProvider.isLoading = false;
      
                      Preferences.email = loginProvider.email;
                      Preferences.name = loginProvider.nombres;
                      Preferences.lastname = loginProvider.apellidos;
                      Preferences.number = loginProvider.phone;
                      Preferences.tipoUsuario = loginProvider.tipoUsuario;
      
                      Navigator.pushReplacementNamed(context, MyRoutes.rHOME);
                    },
                  ),
                ),
                _buildSignInWithText(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}