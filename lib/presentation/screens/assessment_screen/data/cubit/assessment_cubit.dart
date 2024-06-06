import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/models/new_assessment.dart';
import 'package:measure_ap/models/questions.dart';
import 'package:measure_ap/presentation/screens/assessment_screen/data/assessment_repository.dart';

part 'assessment_state.dart';

class AssessmentCubit extends Cubit<AssessmentState> {
  final BaseAssessment assessment;
  AssessmentCubit(List<Question> questions, this.assessment)
      : super(AssessmentState(
            questions: questions,
            answers: List.filled(questions.length, false)));

  void answerQuestion(dynamic answer) {
    final currentIndex = state.currentIndex;
    List<bool> answers = [...state.answers];
    answers[currentIndex] = answer;
    emit(state.copyWith(answers: answers));
  }

  void nextQuestion() {
    if (state.currentIndex < state.questions.length - 1) {
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
    } else {
      finishAssessment();
      emit(state.copyWith(showResult: true));
    }
  }

  void previousQuestion() {
    if (state.showResult) {
      emit(state.copyWith(showResult: false));
      return;
    }
    if (state.currentIndex > 0) {
      emit(state.copyWith(currentIndex: state.currentIndex - 1));
    }
  }

  void finishAssessment() async {
    final AssessmentRepository assessmentRepository = AssessmentRepository();
    try {
      final Map<String, bool> answersMap = state.answers
          .asMap()
          .map((index, value) => MapEntry("Question ${index+1}", value));
      await assessmentRepository.addAssessmentResult(assessment, answersMap);
    } catch (e) {
      print(e);
    }
  }
}
