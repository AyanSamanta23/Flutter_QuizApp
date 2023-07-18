import 'package:app2/data/questions.dart';
import 'package:app2/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.chosenAnswers,Key? key, required this.onRestart}) : super(key: key);

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSumData()
  {
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i<chosenAnswers.length; i++)
      {
        summary.add({'question_index':i,
        'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer' : chosenAnswers[i]
        });
      }

    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final sumData = getSumData();
    final tot_quest = questions.length;
    final num_cor_quest = sumData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("You answered $num_cor_quest out of $tot_quest",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(150, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height:30),
            QuestionSum(summaryData: getSumData()),
            TextButton.icon(onPressed:onRestart,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,

                ),
            icon: const Icon(Icons.refresh),
            label: const Text('Restart Quiz'),)


          ],
        ),
      ),
    );
  }
}
