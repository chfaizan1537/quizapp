import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/03login.dart';

class textfield {
static customTextField(TextEditingController controller, String text, IconData iconData,bool toHide) {
  return TextField(
    controller: controller,
    style: TextStyle(
      fontSize: 20
    ),
    obscureText: toHide,
    decoration: InputDecoration(
      hintText: text,
      suffixIcon: Icon(iconData),
      // focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),

    ),
  );
}
}