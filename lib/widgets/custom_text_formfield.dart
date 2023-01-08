import 'package:buscappme/util/color_util.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final int? maxLines;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function()? onTap;

  const CustomTextFormField({
    super.key,
    this.initialValue,
    this.keyboardType,
    this.hintText,
    this.maxLines = 1,
    this.onChanged,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged!,
      initialValue: initialValue,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: ColorsPanel.cBase),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: ColorsPanel.cSkyBlue),
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        fillColor: ColorsPanel.cWhite,
        contentPadding: const EdgeInsets.all(15),
      ),
      onTap: onTap
    );
  }
}
