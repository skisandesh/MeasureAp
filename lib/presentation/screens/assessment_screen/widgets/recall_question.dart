import 'package:flutter/material.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/models/questions.dart';

class RecallQuestion extends StatelessWidget {
  final RecallQuestionModel question;

  const RecallQuestion({super.key, 
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question.recallText,
          style: mediumType14,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          question.questionText,
          style: boldType24,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          question.questionDescription,
          style: mediumType14,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
