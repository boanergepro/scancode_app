import 'package:flutter/material.dart';

Widget customTextField({
  TextInputType keyboardType: TextInputType.text,
  String labelText,
  IconData prefixIcon,
  TextEditingController controller,
  int maxLines,
  Function onTap,
  bool obscureText: false,
}){
  return TextField(
    obscureText: obscureText,
    onTap: onTap,
    maxLines: maxLines,
    cursorColor: Colors.red,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomLeft: Radius.circular(18),
          topLeft: Radius.circular(18),
        ),
      ),
      labelText: labelText,
      prefixIcon: Icon(prefixIcon),
    ),
    controller: controller,
  );
}