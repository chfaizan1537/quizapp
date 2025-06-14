import 'package:flutter/material.dart';

class pquestclass{
  pquestclass({required this.pquest, required this.pans});
  String pquest;
  List<String> pans;
  List<String> shuffle(){
    List<String> shuffeledd=List.of(pans);
    shuffeledd.shuffle();
    return shuffeledd;
  }
}