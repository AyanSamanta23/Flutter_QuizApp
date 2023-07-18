import 'package:app2/data/questions.dart';
import 'package:app2/questions_screen.dart';
import 'package:app2/resultscreen.dart';
import 'package:flutter/material.dart';
import 'package:app2/home.dart';
import 'package:app2/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];
  var activeScreen = 'home_screen';


  void resatrtQuiz()
  {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'QuestionScreen';
    });
  }

  void switchScreen()
  {
    setState(() {
      activeScreen = 'QuestionScreen';
    });
  }

  void chosenAnswers(String answer)
  {
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length) {
        setState(() {
          activeScreen = 'ResultScreen';

        });
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget screenWidget = home_screen(switchScreen);

    if(activeScreen == 'QuestionScreen')
      {
        screenWidget = QuestionScreen(selectAnswer: chosenAnswers);
      }


    if(activeScreen == 'ResultScreen')
      {
          screenWidget = ResultScreen(chosenAnswers: selectedAnswers,
          onRestart: resatrtQuiz,);
      }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.indigo.shade400]
                )
            ),
            child: screenWidget
        ),
      ),
    );
  }
}
