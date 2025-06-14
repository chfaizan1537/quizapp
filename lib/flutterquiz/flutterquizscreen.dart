import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/flutterquiz/fqueslist.dart';
import 'package:untitled/flutterquiz/questionclass.dart';
import 'package:untitled/custombutton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/flutterquiz/fresultscreen.dart';
import 'package:untitled/05homepage.dart';
class FquizScreen extends StatefulWidget{
  FquizScreen({required this.selectedAnswer,super.key});
final void Function(String answer) selectedAnswer;
  @override
  State<FquizScreen> createState(){
    return _FquizScreen();
  }
}
class _FquizScreen extends State<FquizScreen>{
  List<String> selectedAnswer=[];

 var questionindex=0;


  void upquindex(String answer){
setState(() {
  if(questionindex<9) {
    selectedAnswer.add(answer);
    questionindex = questionindex + 1;
  }
  else if (questionindex==9){
    selectedAnswer.add(answer);

  }
});
  }
  void restart(){
    setState(() {
      questionindex=0;
    });
  }

  @override
  Widget build(context){
    final fcurntquest=fquestions[questionindex] as Fquest;
    var showindex=questionindex+1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.black,size: 30,)),
        title:  Center(child: Text('$showindex/10',style: TextStyle(color: Colors.black),))
      ),
        body:   Container(
decoration: BoxDecoration(
  gradient: LinearGradient(colors: [Colors.deepPurpleAccent,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)
),
          child: SingleChildScrollView(
            child: Column(
            
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text('Flutter Quiz ',style: TextStyle(fontSize: 30,color: Colors.black),)),
                SizedBox(height: 50,),
                   Container
                     (
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
            
                                        decoration:BoxDecoration(
            
                                            gradient: LinearGradient(colors: [Colors.deepPurpleAccent,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter),
                                          borderRadius: BorderRadius.circular(20),
            
            
                                        ),
            
                                        height: 150,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.all(30),
                                          child: Text(fcurntquest.Fques,style: GoogleFonts.abel(
                                                               fontWeight: FontWeight.bold,
                                                               decoration: TextDecoration.none,
                                                               fontSize: 20,
                                                               color: Colors.black
            
                                          )
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 40,),
                                      ... fcurntquest.shuffleanswer().map((e){
                                        return custombtn(tap: (){
                         upquindex(e);
                                        }, text: e);
            
                                      },
            
            
                                      ),
            
                                    ],
                         ),
                       ),
                     ),
                   ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent.shade100,

                      ),

                      onPressed: (){
                    restart();
                  }, child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('Restart',style: TextStyle(color: Colors.black),))
                ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent.shade100,

                        ),
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            title: 'Submit Successfully',
                            dialogType: DialogType.success,
                            btnCancelOnPress: (){},
                            btnOkOnPress: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => fresultScreen(selectedAnswer: selectedAnswer),));
                            },
                          ).show();
                        }, child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('Submit',style: TextStyle(color: Colors.black),))
                    ),




                  ])

              ],
            ),
          ),
        ),
      );

  }
}