import 'package:flutter/material.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/presentation/widgets/cutom_image.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomImageView(
                  imagePath: AssetsConstant.profilePic,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back',
                      style: mediumType12,
                    ),
                    Text(
                      'Dr. Johnson',
                      style: boldType16,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Monday',
                  style: mediumType12,
                ),
                Text(
                  '16 April, 2024',
                  style: boldType16,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
