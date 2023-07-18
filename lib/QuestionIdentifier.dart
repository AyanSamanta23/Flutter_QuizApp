import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({Key? key, required this.questionindex, required this.isCorrect}) : super(key: key);

  final int questionindex;
  final bool isCorrect;
  @override
  Widget build(BuildContext context) {
    final questionNumber = questionindex+1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect ? const Color.fromARGB(255,150, 198, 241) : 
            const Color(0xffe57373),
        borderRadius: BorderRadius.circular(100)
      ),

      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 2, 56)
        ),
      ),

    );
  }
}
