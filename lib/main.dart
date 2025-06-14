import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/00splash.dart';
import 'package:untitled/02firstscreen.dart';
import 'package:untitled/03login.dart';
import 'package:untitled/04signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBw2w7JNd4jyzTiykAE2lXJczTvr1WXNio",
        appId: "1:543190692344:web:69391e0d20e81cc471660d",
        messagingSenderId: "543190692344",
        projectId: "semester-project-56e91",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: splashscreen()));
}
