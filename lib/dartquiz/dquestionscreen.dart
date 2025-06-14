import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/dartquiz/dquestionlist.dart';
import 'package:untitled/dartquiz/dquestionlist.dart';
import 'package:untitled/custombutton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/dartquiz/dcustombutton.dart';
import 'package:untitled/dartquiz/dresultscreen.dart';

import 'package:untitled/05homepage.dart';
class dquizScreen extends StatefulWidget {
  dquizScreen({required this.selectedAnswer,super.key});
  final void Function(String answer) selectedAnswer;
  @override
  State<dquizScreen> createState() {
    return _dquizScreen();
  }
}

class _dquizScreen extends State<dquizScreen> {

  List<String> selectedAnswer=[];
  var quesindex = 0;

  void upindex(String answer){
    setState(() {
      if(quesindex < 9) {
       selectedAnswer.add(answer);
        quesindex = quesindex + 1;
      }
      else if (quesindex==9){
        selectedAnswer.add(answer);

      }

    });
  }

  void restart() {
    setState(() {
      quesindex = 0;
    });
  }
  int corct=0;
  int eveluate(){

    setState(() {
      corct++;

    });
    return corct;
  }


  @override
  Widget build(context) {
    final dcurntquest = dquest[quesindex];
    var shoindex = quesindex + 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
        ),
        title: Center(
          child: Text('$shoindex/10', style: TextStyle(color: Colors.black)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pinkAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Dart Quiz ',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 450,
                width: 350,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                // Deep pink
                                Color(0xFFE91E63),
                                Colors.white
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 150,
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: Text(
                              dcurntquest.dquest,
                              style: GoogleFonts.abel(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        ...dcurntquest.shuffle().map((e) {
                          return dcustombtn(ta: (){
                            upindex(e);
                            eveluate();
                          }, tex:e);
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    height: 50,
                    width: 140,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF8BBD0),
                      ),
                      onPressed: () {
                        restart();
                      },
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Restart', style: TextStyle(color: Colors.black))),

                    ),
                  ),
                  SizedBox(width: 10,),
                 SizedBox(
                   height: 50,
                   width: 140,
                   child: ElevatedButton (
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF8BBD0),
                        ),
                        onPressed: () {
                          AwesomeDialog(context: context,
                          dialogType: DialogType.success,
                              animType: AnimType.rightSlide,
                              title: 'Submit Successfully',
                              btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DresultScreen(selectedAnswer:selectedAnswer),));
                          },
                          ).show();
                        },

                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Submit', style: TextStyle(color: Colors.black))),

                      ),
                 ),


                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
