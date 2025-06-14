import 'package:flutter/material.dart';
class Fquest {
  Fquest({required this.Fques,required this.fans});
  String Fques;
  List<String> fans;
  List<String>shuffleanswer(){
    List<String> shuffeled=List.of(fans);
    shuffeled.shuffle();
    return shuffeled;
  }
}