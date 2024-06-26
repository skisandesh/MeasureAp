part of 'assessment_cubit.dart';

class AssessmentState {
  final List<Question> questions;
  final Map<String,bool> answers;
  final int currentIndex;
  final bool showResult;

  AssessmentState({
    required this.questions,
    this.answers = const {},
    this.currentIndex = 0,
    this.showResult = false
  });

  AssessmentState copyWith({
    List<Question>? questions,
    Map<String,bool>? answers,
    int? currentIndex,
    bool? showResult
  }) {
    return AssessmentState(
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      currentIndex: currentIndex ?? this.currentIndex,
      showResult: showResult?? this.showResult
    );
  }
}
