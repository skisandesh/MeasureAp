import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:measure_ap/constants/color_constant.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/models/questions.dart';
import 'package:measure_ap/presentation/widgets/cutom_image.dart';
import 'package:measure_ap/utils/size.config.dart';

class IdentificationQuestion extends StatefulWidget {
  final IdentificationQuestionModel question;
  final ValueChanged<bool> onAnswer;

  const IdentificationQuestion({super.key, 
    required this.question,
    required this.onAnswer,
  });

  @override
  State<IdentificationQuestion> createState() => _IdentificationQuestionState();
}

class _IdentificationQuestionState extends State<IdentificationQuestion> {
  late List<bool> _switchValues;

  @override
  void initState() {
    super.initState();
    _switchValues = List<bool>.filled(widget.question.options.length, false);
  }

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
        const Divider(),
        ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          shrinkWrap: true,
          itemCount: widget.question.options.length,
          itemBuilder: (ctx, index) {
            final option = widget.question.options[index];
            return Padding(
              padding:  EdgeInsets.symmetric(vertical: 16.0.v),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                child: Container(
                                  padding:  EdgeInsets.all(86.adaptSize),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: CustomImageView(
                                    imagePath: option.imgPath,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          padding:  EdgeInsets.all(18.adaptSize),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: greyBorderColor, // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                          child: CustomImageView(
                            height: 24.adaptSize,
                            imagePath: option.imgPath,
                          ),
                        ),
                      ),
                       SizedBox(
                        width: 12.h,
                      ),
                      Text(
                        option.option,
                        style: boldType16,
                      )
                    ],
                  ),
                  CupertinoSwitch(
                    activeColor: orange500,
                    value: _switchValues[index],
                    onChanged: (bool value) {
                      setState(() {
                        _switchValues[index] = value;
                      });
                      widget.onAnswer(_switchValues[widget.question.correctIndex]);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
