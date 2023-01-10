import 'package:buscappme/domain/providers/login_provider.dart';
import 'package:buscappme/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginInput extends StatefulWidget {
  final TextEditingController? controller;
  final String input;
  final String hintText;

  const LoginInput({super.key, required this.controller, required this.input, required this.hintText});

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
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      autocorrect: false,
      obscureText: _ispassword && widget.input == 'password',
      keyboardType: widget.input == 'email'
          ? TextInputType.emailAddress
          : (widget.input == 'phone') ? TextInputType.phone : TextInputType.text,
      decoration: _buildDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(
          widget.input == 'email' ? Icons.email_rounded : (widget.input == 'email') ? Icons.security : Icons.abc,
          color: ColorsPanel.cYellow,
        ),
        suffixIcon: widget.input == 'password'
            ? InkWell(
                onTap: _viewPassword,
                child: Icon(
                  _ispassword
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  color: ColorsPanel.cYellow,
                ),
              )
            : null,
      ),
      onChanged: (value) => loginProvider.setValueINput(value, widget.input),
      validator: (value) {
        if (widget.input == 'password') {
          return (value != null && value.length >= 8) ? null : 'La contraseña debe contar con más de 8 caracteres';
        }
        if (widget.input == 'email') {
          String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regExp = RegExp(pattern);

          return regExp.hasMatch(value ?? '') ? null : 'Correo ingresado no es válido.';
        }

        return (value != null && value != '') ? null : 'Este Campo es Requerido';
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
    hintText: hintText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    border: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    prefixStyle: const TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(5),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(5),
    ),
    filled: true,
    fillColor: const Color.fromARGB(255, 5, 20, 47),
    hintStyle: const TextStyle(color: Colors.grey),
    contentPadding: const EdgeInsets.all(18),
  );
}
