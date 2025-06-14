import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/pythonquiz/pquestionlist.dart';
import 'package:untitled/pythonquiz/pquestclass.dart';
import 'package:untitled/pythonquiz/pcustombutn.dart';
import 'package:untitled/pythonquiz/presultscreen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class pquizScreen extends StatefulWidget {
  pquizScreen({required this.selectedAnswer,super.key});
  final void Function(String answer) selectedAnswer;
  @override
  State<pquizScreen> createState() {
    return _pquizScreen();
  }
}

class _pquizScreen extends State<pquizScreen> {
  List<String> selectedAnswer=[];
  var quesindex = 0;

  void upindex(String answer) {
    setState(() {
      if(quesindex<9) {
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

  @override
  Widget build(context) {
    final pcurntquest = pquest[quesindex];
    var shoindex = quesindex + 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFF0D47A1), // Dark Blue
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
              Color(0xFF0D47A1),
              Colors.white,],
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
                  'Python Quiz ',
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
                                Color(0xFF0D47A1),
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
                              pcurntquest.pquest,
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
                        ...pcurntquest.shuffle().map((e) {
                          return pcustombtn(tapp: (){
                            upindex(e);
                          }, textt:e);
                        }
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.blue.shade200,
                  ),
                  onPressed: () {
                    restart();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('Restart', style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Colors.blue.shade200,

                    ),
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        title: 'Submit Successfully',
                        dialogType: DialogType.success,
                        btnCancelOnPress: (){},
                        btnOkOnPress: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => presultScreen(selectedAnswer: selectedAnswer),));
                        },
                      ).show();
                    }, child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('Submit',style: TextStyle(color: Colors.black),))
                ),

              ],),


            ],
          ),
        ),
      ),
    );
  }
}
