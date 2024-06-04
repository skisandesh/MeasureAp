import 'package:flutter/material.dart';
import 'package:measure_ap/constants/export_constants.dart';

import 'package:measure_ap/data/models/history.dart';
import 'package:measure_ap/presentation/widgets/cutom_image.dart';
import 'package:measure_ap/presentation/widgets/shadow_container.dart';
import 'package:measure_ap/utils/convert_datetime.dart';

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
          itemCount: dummyHistory.length, // Replace with your data length
          itemBuilder: (context, index) {
            return HistoryCard(
              historyItem: dummyHistory[index],
            );
          },
        ),
      ],
    );
  }
}

class HistoryCard extends StatelessWidget {
  final History historyItem;
  const HistoryCard({super.key, required this.historyItem});

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                    color: const Color(0xFF4D6FE7).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Text(
                      historyItem.code,
                      style: body14Extrabold,
                    ),
                    ellipseContainer(blue700Color),
                    Text(
                      historyItem.testType,
                      style: body14Medium,
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
              color: blue700Color,
            ),
          ],
        ),
        const SizedBox(
          height: 28,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              historyItem.patientName,
              style: w600Type18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      historyItem.gender,
                      style: boldType14,
                    ),
                    ellipseContainer(greyColor),
                    Text(
                      '${historyItem.age} Years old',
                      style: boldType14,
                    ),
                    ellipseContainer(greyColor),
                    Text(
                      '${historyItem.weight} kg',
                      style: boldType14,
                    ),
                  ],
                ),
                Text(
                  formatDateToString(historyItem.date),
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
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        color: color, // Replace with desired color
        shape: BoxShape.circle, // Makes the container circular
      ),
    );
  }
}
