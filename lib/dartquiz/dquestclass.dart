import 'package:flutter/material.dart';

class dquestclass{
  dquestclass({required this.dquest, required this.dans});
  String dquest;
  List<String> dans;
List<String> shuffle(){
  List<String> shuffeledd=List.of(dans);
  shuffeledd.shuffle();
  return shuffeledd;
}
}