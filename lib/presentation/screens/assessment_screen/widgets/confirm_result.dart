import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/constants/color_constant.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/presentation/screens/assessment_screen/data/cubit/assessment_cubit.dart';
import 'package:measure_ap/utils/size.config.dart';

class ConfirmResults extends StatelessWidget {
  const ConfirmResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.adaptSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Confirm the results', style: boldType24),
          SizedBox(height: 20.v),
          Container(
            padding: EdgeInsets.all(16.adaptSize),
            decoration: BoxDecoration(
                border: Border.all(color: greyBorderColor),
                borderRadius: BorderRadius.circular(15.adaptSize),
                color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: 32.v,
                ),
                const CircularProgressWidget(),
                SizedBox(
                  height: 16.v,
                ),
                const Divider(),
                SizedBox(
                  height: 8.v,
                ),
                BlocBuilder<AssessmentCubit, AssessmentState>(
                  builder: (context, state) {
                    return Column(
                      children: state.answers.entries.map<Widget>((entry) {
                        bool isCorrect = entry.value;
                        String question = entry.key;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0.v),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                question,
                                style: mediumTypeBlack14,
                              ),
                              Text(
                                isCorrect ? 'Correct' : 'Incorrect',
                                style: isCorrect ? body14Green : body14Brown,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircularProgressWidget extends StatelessWidget {
  const CircularProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssessmentCubit, AssessmentState>(
      builder: (context, state) {
        final totalQuestion = state.questions.length;
        final totalCorrect =
            state.answers.values.where((value) => value == true).length;

        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 135.adaptSize,
              height: 135.adaptSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade300,
                  // width: 1,
                ),
              ),
            ),
            SizedBox(
              width: 135.adaptSize,
              height: 135.adaptSize,
              child: CircularProgressIndicator(
                value: totalCorrect / 18,
                strokeWidth: 16.h,
                backgroundColor: greyBorderColor,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(circularProgressColor),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text("${totalCorrect * 3}", style: largeType36),
                  Text("/18", style: smallType12),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
