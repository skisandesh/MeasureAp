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
        ));

  void answerQuestion(bool answer) {
  final currentIndex = state.currentIndex;
  Map<String, bool> updatedAnswers = Map<String, bool>.from(state.answers);
  updatedAnswers["Question ${currentIndex + 1}"] = answer;
  emit(state.copyWith(answers: updatedAnswers));
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
    
      await assessmentRepository.addAssessmentResult(assessment, state.answers);
    } catch (e) {
      print(e);
    }
  }
}
