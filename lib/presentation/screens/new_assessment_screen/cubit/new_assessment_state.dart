
class NewAssessmentState {
  final String? cognitiveStatus;
  final String? applicableMeasures;
  final String? patientName;
  final bool isStartButtonEnabled;

  NewAssessmentState({
    this.cognitiveStatus,
    this.applicableMeasures,
    this.patientName,
    this.isStartButtonEnabled = false,
  });

  NewAssessmentState copyWith({
    String? cognitiveStatus,
    String? applicableMeasures,
    String? patientName,
    bool? isStartButtonEnabled,
  }) {
    return NewAssessmentState(
      cognitiveStatus: cognitiveStatus ?? this.cognitiveStatus,
      applicableMeasures: applicableMeasures ?? this.applicableMeasures,
      patientName: patientName ?? this.patientName,
      isStartButtonEnabled: isStartButtonEnabled ?? this.isStartButtonEnabled,
    );
  }
}
