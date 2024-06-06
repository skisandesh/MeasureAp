import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/models/new_assessment.dart';
import 'package:measure_ap/presentation/screens/new_assessment_screen/cubit/new_assessment_state.dart';
import 'package:measure_ap/utils/navigator_service.dart';

class NewAssessmentCubit extends Cubit<NewAssessmentState> {
  NewAssessmentCubit({BaseAssessment? assessment})
      : super(NewAssessmentState(assessment: assessment)) {
    if (assessment != null) {
      emit(state.copyWith(
        assessment: assessment,
        isStartButtonEnabled: true,
      ));
    }
  }

  void setCognitiveStatus(String value) {
    emit(state.copyWith(
      assessment: state.assessment?.copyWith(cognitiveStatus: value),
      isStartButtonEnabled: value.isNotEmpty &&
          state.assessment?.applicableMeasures != null &&
          state.assessment?.patientName != null,
    ));
  }

  void setApplicableMeasures(String value) {
    emit(state.copyWith(
      assessment: state.assessment?.copyWith(applicableMeasures: value),
      isStartButtonEnabled: value.isNotEmpty &&
          state.assessment?.cognitiveStatus != null &&
          state.assessment?.patientName != null,
    ));
  }

  void setPatientName(String value) {
    emit(state.copyWith(
      assessment: state.assessment?.copyWith(patientName: value),
      isStartButtonEnabled: value.isNotEmpty &&
          state.assessment?.cognitiveStatus != null &&
          state.assessment?.applicableMeasures != null,
    ));
  }

  void startAssessment() {
    emit(state.copyWith(isLoading: true));
    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(isLoading: false));
      NavigatorService.pushNamed('/assessment', arguments: state.assessment);
    });
  }
}
