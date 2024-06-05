import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/data/models/new_assessment.dart';
import 'package:measure_ap/presentation/screens/new_assessment_screen/cubit/new_assessment_cubit.dart';
import 'package:measure_ap/presentation/screens/new_assessment_screen/cubit/new_assessment_state.dart';
import 'package:measure_ap/presentation/widgets/custom_app_bar.dart';
import 'package:measure_ap/presentation/widgets/custom_button.dart';
import 'package:measure_ap/utils/navigator_service.dart';

class NewAssessmentScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    final Assessment? assessment =
        ModalRoute.of(context)?.settings.arguments as Assessment?;
    return BlocProvider(
      create: (context) => NewAssessmentCubit(assessment),
      child: const NewAssessmentScreen(),
    );
  }

  const NewAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0XFFF4F4F4),
      appBar: CustomAppBar(title: "New assessment"),
      body: NewAssessmentBody(),
    );
  }
}

class NewAssessmentBody extends StatelessWidget {
  const NewAssessmentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dropDownSection(
                  context,
                  "Cognitive status",
                  "Select cognitive status",
                  (value) => context
                      .read<NewAssessmentCubit>()
                      .setCognitiveStatus(value!),
                  (state) => state.cognitiveStatus,
                  ['Cognition', 'Z00.00', 'Z01.89'],
                  isEnabled: true,
                ),
                const SizedBox(height: 33),
                BlocBuilder<NewAssessmentCubit, NewAssessmentState>(
                  builder: (context, state) {
                    return _dropDownSection(
                      context,
                      "Applicable measures",
                      "Select applicable measures",
                      (value) => context
                          .read<NewAssessmentCubit>()
                          .setApplicableMeasures(value!),
                      (state) => state.applicableMeasures,
                      ['SLUMS', 'Physical Examination', 'Diagnostic Tests'],
                      isEnabled: state.cognitiveStatus != null,
                    );
                  },
                ),
                const SizedBox(height: 33),
                BlocBuilder<NewAssessmentCubit, NewAssessmentState>(
                  builder: (context, state) {
                    return _textFieldSection(
                      context,
                      "Patient",
                      "Enter patient name or ID",
                      (value) => context
                          .read<NewAssessmentCubit>()
                          .setPatientName(value),
                      isEnabled: state.applicableMeasures != null,
                    );
                  },
                ),
              ],
            ),
          ),
          BlocBuilder<NewAssessmentCubit, NewAssessmentState>(
            builder: (context, state) {
              return CustomButton(
                onTap: state.isStartButtonEnabled
                    ? () => NavigatorService.pushNamed("/loading")
                    : () {},
                color: state.isStartButtonEnabled ? black600Color : Colors.grey,
                hasShadow: state.isStartButtonEnabled ? true : false,
                child: Center(
                  child: Text(
                    "Start assessment",
                    style: mediumType18White,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _dropDownSection(
    BuildContext context,
    String title,
    String hintText,
    Function(String?) onChanged,
    String? Function(NewAssessmentState) valueSelector,
    List<String> items, {
    bool isEnabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: mediumType16,
        ),
        const SizedBox(height: 4),
        BlocBuilder<NewAssessmentCubit, NewAssessmentState>(
          builder: (context, state) {
            String? selectedValue = valueSelector(state);
            if (selectedValue != null && !items.contains(selectedValue)) {
              selectedValue = null; // Ensure the selected value is always valid
            }
            return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 17.0, horizontal: 12),
              decoration: BoxDecoration(
                color: isEnabled ? Colors.white : Colors.grey[200],
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 1),
              ),
              child: DropdownButtonFormField<String>(
                iconSize: 0,
                hint: Text(hintText, style: mediumType16),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                ),
                value: selectedValue,
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: isEnabled ? onChanged : null,
                disabledHint: Text(hintText,
                    style: mediumType16.copyWith(color: Colors.grey)),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _textFieldSection(
    BuildContext context,
    String title,
    String hintText,
    Function(String) onChanged, {
    bool isEnabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: mediumType16,
        ),
        const SizedBox(height: 4),
        BlocBuilder<NewAssessmentCubit, NewAssessmentState>(
          builder: (context, state) {
            TextEditingController controller =
                TextEditingController(text: state.patientName);
            return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 17.0, horizontal: 12),
              decoration: BoxDecoration(
                color: isEnabled ? Colors.white : Colors.grey[200],
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 1),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: mediumType16.copyWith(
                      color: isEnabled ? Colors.black : Colors.grey),
                ),
                onChanged: isEnabled ? onChanged : null,
                enabled: isEnabled,
              ),
            );
          },
        ),
      ],
    );
  }
}
