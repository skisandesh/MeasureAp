import 'package:flutter/material.dart';
import 'package:measure_ap/constants/color_constant.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/utils/size.config.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 12.0.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: boldType18,
          ),
          Row(
            children: [
              Text(
                'See more',
                style: boldType12,
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: 14.h,
                color: greyColor,
              )
            ],
          ),
        ],
      ),
    );
  }
}
