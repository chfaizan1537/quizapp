import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class resetpassword extends StatefulWidget {
   resetpassword({super.key});


  @override
  State<resetpassword> createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  reset(String email){
    if(email==''){
      return AlertDialog(
        title: Text('Please enter email'),
      );
    }
    else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }
  TextEditingController email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        backgroundColor: Colors.deepPurpleAccent,

      ),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
          Stack(
            clipBehavior: Clip.none,
            children: [ Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.deepPurpleAccent,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(20)

              ),
              height: 350,
              width: 300,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 80,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0), // Curve here
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: 'Enter text',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0), // Same curve
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            filled: true,
                            fillColor: Colors.grey[100],
                          ),
                        ),

                      ),
                      SizedBox(height: 30,),
                      ElevatedButton(onPressed: (){
                        reset(email.text.toString());
                      }, child: Text('Reset Password'))
                    ],
                  )
                ),
              ),
            ),
            Positioned(
              height: 200,
                width: 200,
                top: -80,

                child: Image(image: AssetImage('assets/images/hotair.png')))
            ],
          ),
          
        ],),
      ),
      
    );
  }
}
