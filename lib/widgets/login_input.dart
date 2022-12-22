import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/providers/login_provider.dart';

class LoginInput extends StatefulWidget {
  final TextEditingController? controller;
  final String input;

  const LoginInput({super.key, required this.controller, required this.input});

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  bool _ispassword = true;

  void _viewPassword() {
    setState(() {
      _ispassword = !_ispassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return TextFormField(
      controller: widget.controller,
      /*  */
      cursorColor: Colors.blue,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      autocorrect: false,
      obscureText: _ispassword && widget.input == 'password',
      keyboardType: widget.input == 'email'
          ? TextInputType.emailAddress
          : TextInputType.text,
      decoration: _buildDecoration(
        hintText:
            widget.input == 'email' ? 'Correo@electrónico.com' : 'Password',
        prefixIcon: Icon(
          widget.input == 'email' ? Icons.email_rounded : Icons.security,
          color: Colors.yellow,
        ),
        suffixIcon: widget.input == 'password'
            ? InkWell(
                onTap: _viewPassword,
                child: Icon(
                  _ispassword
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  color: Colors.black,
                ),
              )
            : null,
      ),
      onChanged: (value) => loginProvider.setValueINput(value, widget.input),
      validator: (value) {
        if (widget.input == 'password') {
          return (value != null && value.length >= 8)
              ? null
              : 'La contraseña debe contar con más de 8 caracteres';
        }
        String pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = RegExp(pattern);

        return regExp.hasMatch(value ?? '')
            ? null
            : 'Correo ingresado no es válido.';
      },
    );
  }
}

InputDecoration _buildDecoration({
  final String? hintText,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.blue),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.blue),
      borderRadius: BorderRadius.circular(15),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.redAccent),
      borderRadius: BorderRadius.circular(15),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.blue),
      borderRadius: BorderRadius.circular(15),
    ),
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
    ),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    prefixIconColor: Colors.blue,
    contentPadding: const EdgeInsets.all(15),
  );
}
