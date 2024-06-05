import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/data/models/questions.dart';
import 'package:measure_ap/presentation/screens/assessment_screen/cubit/assessment_cubit.dart';
import 'package:measure_ap/presentation/screens/assessment_screen/widgets/confirm_result.dart';
import 'package:measure_ap/presentation/screens/assessment_screen/widgets/correct_incorrect_question.dart';
import 'package:measure_ap/presentation/screens/assessment_screen/widgets/identification_question.dart';
import 'package:measure_ap/presentation/screens/assessment_screen/widgets/multiple_choice_question.dart';
import 'package:measure_ap/presentation/screens/assessment_screen/widgets/recall_question.dart';
import 'package:measure_ap/presentation/widgets/custom_app_bar.dart';
import 'package:measure_ap/presentation/widgets/custom_button.dart';
import 'package:measure_ap/presentation/widgets/cutom_image.dart';

class AssessmentScreen extends StatelessWidget {
  const AssessmentScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => AssessmentCubit(dummyQuestions),
      child: const AssessmentScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF4F4F4),
      appBar: const CustomAppBar(
        title: "Assestment",
        actions: true,
      ),
      body: BlocBuilder<AssessmentCubit, AssessmentState>(
        builder: (context, state) {
          final question = state.questions[state.currentIndex];
          return Padding(
            padding: kDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(state.questions.length + 1, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      width: 40,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: state.showResult
                            ? black600Color
                            : index <= state.currentIndex
                                ? black600Color
                                : const Color(0XFFDCE4E8),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 32,
                ),
                if (state.showResult) ConfirmResults(),
                if (question is CorrectIncorrectQuestionModel &&
                    !state.showResult)
                  CorrectIncorrectQuestion(
                    question: question,
                    onAnswer: (answer) {
                      context.read<AssessmentCubit>().answerQuestion(answer);
                    },
                  ),
                if (question is MultipleCorrectIncorrectQuestionModel &&
                    !state.showResult)
                  MultipleCorrectIncorrectQuestion(
                    question: question,
                    onAnswer: (answers) {
                      context.read<AssessmentCubit>().answerQuestion(answers);
                    },
                  ),
                if (question is RecallQuestionModel && !state.showResult)
                  RecallQuestion(
                    question: question,
                  ),
                if (question is IdentificationQuestionModel &&
                    !state.showResult)
                  IdentificationQuestion(
                    question: question,
                    onAnswer: (answers) {
                      context.read<AssessmentCubit>().answerQuestion(answers);
                    },
                  ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (state.showResult)
                      CustomButton(
                          onTap: () {
                            context.read<AssessmentCubit>().previousQuestion();
                          },
                          width: 159,
                          hasBorder: true,
                          color: Colors.transparent,
                          child: Center(
                              child: Text(
                            "Back",
                            style: semiBoldType16,
                          ))),
                    if (state.currentIndex > 0 && !state.showResult)
                      CustomButton(
                          hasBorder: true,
                          onTap: () {
                            context.read<AssessmentCubit>().previousQuestion();
                          },
                          color: Colors.transparent,
                          child: CustomImageView(
                            imagePath: AssetsConstant.leftArrowIcon,
                          )),
                    if (state.currentIndex > 0)
                      const SizedBox(
                        width: 10,
                      ),
                    Expanded(
                      child: CustomButton(
                          onTap: () {
                            context.read<AssessmentCubit>().nextQuestion();
                          },
                          color: black600Color,
                          hasShadow: true,
                          child: Center(
                              child: Text(
                            state.showResult
                                ? "Print"
                                : state.currentIndex ==
                                        state.questions.length - 1
                                    ? "Finish"
                                    : "Continue",
                            style: mediumType18White,
                          ))),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
