import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/dialogbox.dart';
import 'package:untitled/05homepage.dart';
import 'package:untitled/main.dart';
import 'package:untitled/textfield.dart';
import 'package:untitled/04signup.dart';
import 'package:untitled/06resetpassword.dart';

class login extends StatelessWidget {
  login({super.key});
  @override
  Widget build(context) {
    return Login();
  }
}

class Login extends StatefulWidget {
  const Login({super.key});
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String em = '';
  String pa = '';
  void StoreValue() {
    setState(() {
      em = email.text;
      pa = password.text;
    });
  }

  Login(String emaii, String passs) async {
    if (emaii == '' && passs == '') {
      dialogbox.dialog(context, 'please enter credentials');
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emaii,
          password: passs,
        ).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context) => home(),));
        });
      } on FirebaseAuthException catch (e) {
        dialogbox.dialog(context, e.code.toString());
      }
      ;
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Login', style: TextStyle(color: Colors.white)),
          ),
          backgroundColor: Colors.redAccent.shade200,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.redAccent, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Image(image: AssetImage('assets/images/img4.png'), height: 300),
                SizedBox(height: 70),
                Center(
                  child: Container(
                    width: 300,
                    child: textfield.customTextField(
                      email,
                      'Email',
                      Icons.email,
                      false,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Container(
                    width: 300,
                    child: textfield.customTextField(
                      password,
                      'Password',
                      Icons.password,
                      true,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 70),
                    Text("Don't have account", style: TextStyle(fontSize: 13)),
                    
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => signup()),
                        );
                      },
                      child: Text('Signup'),

                    ),
                    TextButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => resetpassword(),));
                    }, child: Text('Reset Password'))
                  ],
                ),


                SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent.shade100,
                    ),

                    onPressed: () {
                      Login(email.text.toString(), password.text.toString());
                    },
                    child: Text('Login', style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 60,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
