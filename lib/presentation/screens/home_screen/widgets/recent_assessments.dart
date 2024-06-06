import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/models/new_assessment.dart';
import 'package:measure_ap/presentation/widgets/cutom_image.dart';
import 'package:measure_ap/presentation/widgets/shadow_container.dart';
import 'package:measure_ap/utils/navigator_service.dart';
import 'package:measure_ap/utils/size.config.dart';
import 'section_header.dart';

class RecentAssessments extends StatelessWidget {
  const RecentAssessments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Recent assessments'),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dummyAssessment.length, // Replace with your data length
          itemBuilder: (context, index) {
            return AssessmentCard(assessmentItem: dummyAssessment[index]);
          },
        ),
      ],
    );
  }
}

class AssessmentCard extends StatelessWidget {
  final Assessment assessmentItem;
  const AssessmentCard({super.key, required this.assessmentItem});

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
        child: Row(
      children: [
        Expanded(
          child: Container(
            padding:  EdgeInsets.symmetric(horizontal: 8.h, vertical: 12.v),
            decoration: BoxDecoration(
                color: const Color(0xFFE7974D).withOpacity(0.12),
                borderRadius: BorderRadius.circular(30.adaptSize)),
            child: Row(
              children: [
                Text(
                  assessmentItem.cognitiveStatus,
                  style: body14ExtraboldOrange,
                ),
                Container(
                  margin:  EdgeInsets.symmetric(horizontal: 8.h),
                  width: 5.h,
                  height: 5.v,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE7974D),
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  assessmentItem.applicableMeasures,
                  style: body14MediumOrange,
                ),
              ],
            ),
          ),
        ),
         SizedBox(
          width: 24.h,
        ),
        GestureDetector(
          onTap: () => NavigatorService.pushNamed("/new_assessment", arguments: assessmentItem),
          child: CustomImageView(
            imagePath: AssetsConstant.circleArrowIcon,
          ),
        ),
      ],
    ));
  }
}
