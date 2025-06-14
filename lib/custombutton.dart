import 'package:flutter/material.dart';

class custombtn extends StatelessWidget{
  custombtn({super.key,required this.tap,required this.text});
  final Function() tap;
  String text;
  @override
  Widget build(context){
    return SizedBox(
      width: 300,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent.shade100
          ),
          onPressed: tap , child: Text(text,style: TextStyle(color: Colors.black),textAlign: TextAlign.center,)),
    );
  }
}