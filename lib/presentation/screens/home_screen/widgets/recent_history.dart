import 'package:flutter/material.dart';
import 'package:measure_ap/constants/color_constant.dart';
import 'package:measure_ap/constants/export_constants.dart';

import 'package:measure_ap/models/new_assessment.dart';
import 'package:measure_ap/presentation/widgets/cutom_image.dart';
import 'package:measure_ap/presentation/widgets/shadow_container.dart';
import 'package:measure_ap/utils/date_conversion.dart';
import 'package:measure_ap/utils/size.config.dart';

import 'section_header.dart';

class RecentHistory extends StatelessWidget {
  const RecentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Recent history'),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dummyAssessment.length, // Replace with your data length
          itemBuilder: (context, index) {
            return HistoryCard(
              assessmentItem: dummyAssessment[index],
            );
          },
        ),
      ],
    );
  }
}

class HistoryCard extends StatelessWidget {
  final Assessment assessmentItem;
  const HistoryCard({super.key, required this.assessmentItem});

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding:  EdgeInsets.symmetric(horizontal: 8.h, vertical: 12.v),
                decoration: BoxDecoration(
                    color: const Color(0xFF4D6FE7).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(30.adaptSize)),
                child: Row(
                  children: [
                    Text(
                      assessmentItem.cognitiveStatus,
                      style: body14Extrabold,
                    ),
                    ellipseContainer(blue700Color),
                    Text(
                      assessmentItem.applicableMeasures,
                      style: body14Medium,
                    ),
                  ],
                ),
              ),
            ),
             SizedBox(
              width: 24.h,
            ),
            CustomImageView(
              imagePath: AssetsConstant.circleArrowIcon,
              color: blue700Color,
            ),
          ],
        ),
         SizedBox(
          height: 28.v,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              assessmentItem.patientName,
              style: w600Type18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      assessmentItem.gender,
                      style: boldType14,
                    ),
                    ellipseContainer(greyColor),
                    Text(
                      '${assessmentItem.age} Years old',
                      style: boldType14,
                    ),
                    ellipseContainer(greyColor),
                    Text(
                      '${assessmentItem.weight} kg',
                      style: boldType14,
                    ),
                  ],
                ),
                Text(
                  formatDateToString(assessmentItem.date),
                  style: boldType14,
                )
              ],
            )
          ],
        )
      ],
    ));
  }

  Container ellipseContainer(Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 5.adaptSize,
      height: 5.adaptSize,
      decoration: BoxDecoration(
        color: color, // Replace with desired color
        shape: BoxShape.circle, // Makes the container circular
      ),
    );
  }
}
