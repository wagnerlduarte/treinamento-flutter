import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  TextEditingController controller;
  String label;
  bool isRequired;
  String errorMessage;
  TextInputType keyboardType;
  TextCapitalization capitalization;
  bool obscureText;

  MyFormField({
    @required this.controller,
    @required this.label,
    this.isRequired = false,
    @required this.errorMessage,
    this.keyboardType,
    this.capitalization = TextCapitalization.none,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyboardType,
      textCapitalization: this.capitalization,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: this.label,

          labelStyle: TextStyle(
            color: Color(0xFFB5B5B5),
          )),
      style: TextStyle(
        color: Color(0xFF3D4A5A),
        fontSize: 20,
      ),
      cursorColor: Color(0xFFE83F3F),
      validator: (value) {
        if (this.isRequired && value.isEmpty) {
          return this.errorMessage;
        }
        return null;
      },
      controller: this.controller,
    );
  }
}
