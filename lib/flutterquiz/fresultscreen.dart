import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/flutterquiz/fqueslist.dart';
class fresultScreen extends StatefulWidget {
  fresultScreen({required this.selectedAnswer, super.key});
  List<String> selectedAnswer;

  @override
  State<fresultScreen> createState() => _fresultScreenState();
}

class _fresultScreenState extends State<fresultScreen> {
  List<Map<String, Object>> printresult() {
    List<Map<String, Object>> finalize = [];

    for (int i = 0; i < widget.selectedAnswer.length && i<fquestions.length; i++) {
      finalize.add({
        'question': fquestions[i].Fques,
        'correctanswer': fquestions[i].fans[0],
        'useranswer': widget.selectedAnswer[i],
      });
    }

    return finalize;
  }



  @override
  Widget build(BuildContext context) {

    final results = printresult();
    final totalquestion=fquestions.length;
    final correctAnswers = results.where((item) =>
    item['useranswer'] == item['correctanswer']).length;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('QUIZ RESULT',style: TextStyle(color: Colors.white),)),
        backgroundColor:Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Lottie.asset('animation/resultanimation.json', height: 200),
            Text(
              'You answered $correctAnswers out of $totalquestion correctly!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: results.length,
              itemBuilder: (context, index) {
                final item = results[index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Q${index+1}: ${item['question']}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text("✅ Correct Answer: ${item['correctanswer']}"),
                        Text("📝 Your Answer: ${item['useranswer']}"),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  widget.selectedAnswer.clear();
                  Navigator.pop(context);

                },
                child: Text("Restart Quiz",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
