import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/02firstscreen.dart';
class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Ap(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.deepPurple,Colors.white,],begin: Alignment.topCenter,end: Alignment.bottomRight)
        ),
        child: Center(child: Lottie.asset('animation/splash.json',reverse: false,repeat: false)),
      ),

    );
  }
}
