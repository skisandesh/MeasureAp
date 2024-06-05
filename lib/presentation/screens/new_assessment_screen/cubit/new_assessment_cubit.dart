import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/data/models/new_assessment.dart';
import 'package:measure_ap/presentation/screens/new_assessment_screen/cubit/new_assessment_state.dart';

class NewAssessmentCubit extends Cubit<NewAssessmentState> {
  final Assessment? assessment;
  NewAssessmentCubit(this.assessment) : super(NewAssessmentState()) {
    if (assessment != null) {
      emit(state.copyWith(
          cognitiveStatus: assessment!.cognitiveStatus,
          applicableMeasures: assessment!.applicableMeasures,
          patientName: assessment!.patientName,
          isStartButtonEnabled: true));
    }
  }

  void setCognitiveStatus(String value) {
    emit(state.copyWith(
      cognitiveStatus: value,
    isStartButtonEnabled: state.cognitiveStatus != null &&
          state.applicableMeasures != null &&
          value.isNotEmpty,
    ));
  }

  void setApplicableMeasures(String value) {
    emit(state.copyWith(
      applicableMeasures: value,
      isStartButtonEnabled: state.cognitiveStatus != null &&
          state.applicableMeasures != null &&
          value.isNotEmpty,
    ));
  }

  void setPatientName(String value) {
    emit(state.copyWith(
      patientName: value,
      isStartButtonEnabled: state.cognitiveStatus != null &&
          state.applicableMeasures != null &&
          value.isNotEmpty,
    ));
  }
}
