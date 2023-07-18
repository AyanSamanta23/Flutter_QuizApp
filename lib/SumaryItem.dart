import 'package:flutter/material.dart';
import 'package:app2/QuestionIdentifier.dart';
import 'package:google_fonts/google_fonts.dart';

class summaryItem extends StatelessWidget {
  const summaryItem(this.ItemData,{Key? key}) : super(key: key);

  final Map<String, Object> ItemData;

  @override
  Widget build(BuildContext context) {
    final isCorrect = ItemData['user_answer'] == ItemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(questionindex: ItemData['question_index'] as int, isCorrect: isCorrect),

        const SizedBox(
          width: 20
        ),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                  Text(
                    ItemData['question'] as String,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold

                    ),
                  ),
            const SizedBox(
              height: 5,
            ),
            Text(ItemData['user_answer']as String,
            style: const TextStyle(
              color: Color.fromARGB(255, 202, 171, 252)
            ),),
            Text(ItemData['correct_answer']as String,
              style: const TextStyle(
                  color: Color.fromARGB(255, 181, 254, 246)
              ),),
          ],
        ))
        
      ],
    );
  }
}
