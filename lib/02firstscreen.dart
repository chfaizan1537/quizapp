import 'package:flutter/material.dart';
import 'package:untitled/03login.dart';
import 'package:untitled/04signup.dart';
class Ap extends StatelessWidget{
  const  Ap({super.key});
  @override
  Widget build (context){
    return st();
  }
}
class st extends StatefulWidget{
  const st({super.key});
  State<st> createState(){
    return _st();
  }
}
class _st extends State<st>{
  @override
  Widget build(context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('QUIZ APP',style: TextStyle(color: Colors.white),)),backgroundColor: Colors.deepPurpleAccent,),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.deepPurpleAccent,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 140,),
                Image(image: AssetImage('assets/images/img1.png')),
                SizedBox(height: 150,),
                Container(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade500

                      ),
                      onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => login(),)), child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white),)),
                ),
                SizedBox(height: 10,),
                SizedBox(

                  width: 200,
                  child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                          backgroundColor: Colors.deepPurpleAccent

                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => signup(),));
                      }, child: Text('Signup',style: TextStyle(fontSize: 20,color: Colors.white),)),

                ),
                SizedBox(height: 30 ,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
