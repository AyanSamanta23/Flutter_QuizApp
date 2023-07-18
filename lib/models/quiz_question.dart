import 'package:flutter/material.dart';

class QuizQuestion
{

  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
  
    final shuf_list = List.of(answers);
    shuf_list.shuffle();
    return shuf_list;
  }
}