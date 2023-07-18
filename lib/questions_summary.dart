import 'package:flutter/material.dart';
import 'package:app2/SumaryItem.dart';


class QuestionSum extends StatelessWidget {
  const QuestionSum({Key? key, required this.summaryData}) : super(key: key);

  final List<Map<String,Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: summaryData.map((data) {
            return summaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
