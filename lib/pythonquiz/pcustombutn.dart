import 'package:flutter/material.dart';

class pcustombtn extends StatelessWidget{
  pcustombtn({super.key,required this.tapp,required this.textt});
  final Function() tapp;
  String textt;
  @override
  Widget build(context){
    return SizedBox(
      width: 300,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:Colors.blueAccent.shade100,
          ),
          onPressed: tapp, child: Text(textt,style: TextStyle(color: Colors.black),textAlign: TextAlign.center,)),
    );
  }
}