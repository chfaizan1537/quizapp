import 'package:flutter/material.dart';
import 'package:untitled/04signup.dart';
class dialogbox{
  static dialog(BuildContext context,String text){
    return  showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(text),
actions: [
  TextButton(onPressed: (){
    Navigator.pop(context);
  }, child: Text('ok'))
],
      );
    },);

  }
}