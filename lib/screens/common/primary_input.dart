
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../resources/app_colors.dart';

class PrimaryInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText, labelText, suffixText;
  int maxLength;
  final TextInputType inputType;

  PrimaryInput({required this.suffixText, required this.hintText, required this.labelText, required this.controller, required this.inputType, required this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
      ],
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.all(5.0),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: colorAppPrimary, width: 0.6),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16, color: Colors.grey.shade400)),
        label: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: labelText, style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w700)),
              TextSpan(
                text: ' $suffixText',
                style: const TextStyle(fontSize: 12, color: Colors.red),
              ),
            ],
          ),
        ),
        labelStyle: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 14, color: Colors.black)),
      ),
    );
  }
}