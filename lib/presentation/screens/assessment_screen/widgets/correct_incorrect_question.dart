import 'package:flutter/material.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/data/models/questions.dart';

class CorrectIncorrectQuestion extends StatefulWidget {
  final CorrectIncorrectQuestionModel question;
  final ValueChanged<bool> onAnswer;

  const CorrectIncorrectQuestion({super.key, 
    required this.question,
    required this.onAnswer,
  });

  @override
  State<CorrectIncorrectQuestion> createState() =>
      _CorrectIncorrectQuestionState();
}

class _CorrectIncorrectQuestionState extends State<CorrectIncorrectQuestion> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.question.questionText,
          style: boldType24,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34.0, vertical: 14),
          child: Text(
            widget.question.questionDescription,
            style: mediumType14,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.question.options.length,
            itemBuilder: (ctx, index) {
              final String option = widget.question.options[index];
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                          color: isSelected ? orange500 : greyBorderColor,
                          width: isSelected ? 2 : 1)),
                  child: Text(
                    option,
                    style: boldType18,
                  ),
                ),
              );
            })
      ],
    );
  }
}
