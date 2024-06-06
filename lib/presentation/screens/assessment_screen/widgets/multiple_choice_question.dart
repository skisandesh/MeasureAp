import 'package:flutter/material.dart';
import 'package:measure_ap/constants/color_constant.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/models/questions.dart';
import 'package:measure_ap/utils/size.config.dart';

class MultipleCorrectIncorrectQuestion extends StatefulWidget {
  final MultipleCorrectIncorrectQuestionModel question;
  final ValueChanged<bool> onAnswer;

  const MultipleCorrectIncorrectQuestion({
    super.key,
    required this.question,
    required this.onAnswer,
  });

  @override
  _MultipleCorrectIncorrectQuestionState createState() =>
      _MultipleCorrectIncorrectQuestionState();
}

class _MultipleCorrectIncorrectQuestionState
    extends State<MultipleCorrectIncorrectQuestion> {
  List<int> selectedIndex = [];

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
            child: ShowMoreText(text: widget.question.questionDescription)),
         SizedBox(
          height: 20.v,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.question.options.length,
            itemBuilder: (ctx, index) {
              final String option = widget.question.options[index];
              final isSelected = selectedIndex.contains(index);
              return GestureDetector(
                onTap: () {
                 
                  setState(() {
                    if (!isSelected) {
                      selectedIndex.add(index);
                    } else {
                      selectedIndex.remove(index);
                    }
                  });
                   widget.onAnswer(selectedIndex.length ==
                          widget.question.correctIndexList.length &&
                      selectedIndex.every((element) =>
                          widget.question.correctIndexList.contains(element)));
                },
                child: Container(
                  padding:  EdgeInsets.all(16.adaptSize),
                  margin:  EdgeInsets.only(bottom: 13.v),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                          color: isSelected ? orange700Color : greyBorderColor,
                          width: isSelected ? 2 : 1)),
                  child: Row(
                    children: [
                      CircularCheckContainer(
                        isSelected: isSelected,
                      ),
                       SizedBox(
                        width: 12.h,
                      ),
                      Text(
                        option,
                        style: boldType18,
                      ),
                    ],
                  ),
                ),
              );
            })
      ],
    );
  }
}

class CircularCheckContainer extends StatelessWidget {
  final bool isSelected;

  const CircularCheckContainer({super.key, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.adaptSize, // Set the width of the circular container
      height: 32.adaptSize, // Set the height of the circular container
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? orange500 : greyBorderColor),
        color: isSelected
            ? orange500
            : Colors.transparent, // Background color of the container
        shape: BoxShape.circle, // Make the container circular
      ),
      child: isSelected
          ? const Center(
              child: Icon(
                Icons.check, // Check mark icon
                color: Colors.white, // Color of the check mark
                size: 24, // Size of the check mark
              ),
            )
          : null,
    );
  }
}

class ShowMoreText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ShowMoreText({
    super.key,
    required this.text,
    this.maxLines = 2,
  });

  @override
  _ShowMoreTextState createState() => _ShowMoreTextState();
}

class _ShowMoreTextState extends State<ShowMoreText> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final span = TextSpan(
          text: widget.text,
          style: mediumType14,
        );

        final tp = TextPainter(
            text: span,
            maxLines: widget.maxLines,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center);

        tp.layout(maxWidth: constraints.maxWidth);

        if (!tp.didExceedMaxLines) {
          return Text(widget.text);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _isExpanded
                  ? widget.text
                  : '${widget.text.substring(0, tp.getOffsetBefore(tp.getPositionForOffset(Offset(tp.width, tp.height * widget.maxLines)).offset))}...',
              style: mediumType14,
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: _toggleExpand,
              child: Center(
                child: Text(
                  _isExpanded ? 'Show less' : 'Show more',
                  style: body14ExtraboldOrange,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
