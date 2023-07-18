import 'package:flutter/material.dart';
import 'package:app2/answer_button.dart';
import 'package:app2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key, required this.selectAnswer}) : super(key: key);

  final void Function(String answer) selectAnswer;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  var ind = 0;

  answerQuestion(String selectedAnswer)
  {
    widget.selectAnswer(selectedAnswer);
    setState(() {
      ind++;
    });
  }

  @override
  Widget build(BuildContext context) {

    final currentQuestion = questions[ind];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: [
            Text(currentQuestion.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(150, 255, 255, 255),
              fontSize: 24,
              fontWeight: FontWeight.bold
            )),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer)
                {
                  return AnswerButton(but_text: answer,
                      on_tap: ()
                  {
                    answerQuestion(answer);
                  });
                }
            )



          ],
        ),
      ),
    );
  }
}
