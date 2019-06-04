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
          bottomRight: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topLeft: Radius.circular(5),
        ),
      ),
      labelText: labelText,
      prefixIcon: Icon(prefixIcon),
    ),
    controller: controller,
  );
}