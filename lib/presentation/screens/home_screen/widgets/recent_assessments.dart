import 'package:flutter/material.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/data/models/history.dart';
import 'package:measure_ap/presentation/widgets/cutom_image.dart';
import 'package:measure_ap/presentation/widgets/shadow_container.dart';
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
          itemCount: dummyHistory.length, // Replace with your data length
          itemBuilder: (context, index) {
            return AssessmentCard(historyItem: dummyHistory[index]);
          },
        ),
      ],
    );
  }
}

class AssessmentCard extends StatelessWidget {
  final History historyItem;
  const AssessmentCard({super.key, required this.historyItem});

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
        child: Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
                color: const Color(0xFFE7974D).withOpacity(0.12),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                Text(
                  historyItem.code,
                  style: body14ExtraboldOrange,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE7974D),
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  historyItem.testType,
                  style: body14MediumOrange,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        CustomImageView(
          imagePath: AssetsConstant.circleArrowIcon,
        ),
      ],
    ));
  }
}