import 'package:flutter/material.dart';

class dcustombtn extends StatelessWidget{
  dcustombtn({super.key,required this.ta,required this.tex});
  final Function() ta;
  String tex;
  @override
  Widget build(context){
    return SizedBox(
      width: 300,

      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor:Colors.pinkAccent.shade100,
          ),
          onPressed: ta, child: Text(tex,style: TextStyle(color: Colors.black),textAlign: TextAlign.center,)),
    );
  }
}