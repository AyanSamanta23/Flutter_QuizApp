import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({Key? key, required this.but_text, required this.on_tap}) : super(key: key);

  final String but_text;
  final void Function() on_tap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: on_tap,
        child: Text(but_text,
        textAlign: TextAlign.center,),
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 10,
      horizontal: 40),
      backgroundColor: const Color.fromARGB(255,33, 1, 95),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
    ));
  }
}
