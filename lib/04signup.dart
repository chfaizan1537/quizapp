import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/05homepage.dart';
import 'package:untitled/03login.dart';
import 'package:untitled/main.dart';
import 'package:untitled/textfield.dart';
import 'package:untitled/dialogbox.dart';
import 'package:untitled/02firstscreen.dart';

class signup extends StatelessWidget {
  signup({super.key});
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Signup', style: TextStyle(color: Colors.white)),
          ),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Signup(),
      ),
    );
  }
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController ema = TextEditingController();
  TextEditingController pass = TextEditingController();
  String e = '';
  String p = '';
  void storeValue() {
    setState(() {
      e = ema.text;
      p = pass.text;
    });
  }
   signup(emai,pas)async{
    if(emai=='' && pas==''){
      dialogbox.dialog(context, 'Enter required fields');
    }
    else{
      UserCredential? usercredential;
      try{
        usercredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emai, password: pas).then((value){
          Navigator.push(context,MaterialPageRoute(builder: (context) => st(),) );

        }

        );

      }
      on FirebaseAuthException catch(e){
        dialogbox.dialog(context, e.code.toString());
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.deepPurpleAccent,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/img3.png'), height: 300),
            SizedBox(height: 80),
            Center(
              child: Container(
                width: 300,
                child: textfield.customTextField(
                  ema,
                  'Email',
                  Icons.email,
                  false,
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                width: 300,
                child: textfield.customTextField(
                  pass,
                  'Password',
                  Icons.password,
                  true,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 100),
                Text('Already have a account', style: TextStyle(fontSize: 13)),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
                }, child: Text('Login')),
              ],
            ),

            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent.shade200,
                ),
      
                onPressed: () {
                  signup(ema.text.toString(), pass.text.toString());

                },
                child: Text('Signup', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
