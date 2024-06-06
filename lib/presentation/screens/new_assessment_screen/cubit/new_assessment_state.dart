import 'package:measure_ap/models/new_assessment.dart';

class NewAssessmentState {
  final BaseAssessment? assessment;
  final bool isStartButtonEnabled;
  final bool isLoading;

  NewAssessmentState({
    this.assessment,
    this.isStartButtonEnabled = false,
    this.isLoading = false,
  });

  NewAssessmentState copyWith({
    BaseAssessment? assessment,
    bool? isStartButtonEnabled,
    bool? isLoading,
  }) {
    return NewAssessmentState(
      assessment: assessment ?? this.assessment,
      isStartButtonEnabled: isStartButtonEnabled ?? this.isStartButtonEnabled,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
