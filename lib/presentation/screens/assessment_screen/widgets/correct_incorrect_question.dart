import 'package:flutter/material.dart';
import 'package:measure_ap/constants/color_constant.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/models/questions.dart';
import 'package:measure_ap/utils/size.config.dart';

class CorrectIncorrectQuestion extends StatefulWidget {
  final CorrectIncorrectQuestionModel question;
  final ValueChanged<bool> onAnswer;

  const CorrectIncorrectQuestion({
    super.key,
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
          padding:  EdgeInsets.symmetric(horizontal: 34.0.h, vertical: 14.v),
          child: Text(
            widget.question.questionDescription,
            style: mediumType14,
            textAlign: TextAlign.center,
          ),
        ),
         SizedBox(
          height: 20.v,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.question.options.length,
            itemBuilder: (ctx, index) {
              final String option = widget.question.options[index];
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {

                  widget.onAnswer(widget.question.correctIndex == index);
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin:  EdgeInsets.only(bottom: 13.v),
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
