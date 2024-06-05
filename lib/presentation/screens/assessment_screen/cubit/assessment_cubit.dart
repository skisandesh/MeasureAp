import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/data/models/questions.dart';

part 'assessment_state.dart';

class AssessmentCubit extends Cubit<AssessmentState> {
  AssessmentCubit(List<Question> questions)
      : super(AssessmentState(questions: questions, answers: List.filled(questions.length, false)));

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
}
