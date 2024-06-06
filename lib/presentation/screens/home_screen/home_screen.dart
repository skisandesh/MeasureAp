import 'package:flutter/material.dart';
import 'package:measure_ap/constants/color_constant.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/presentation/screens/home_screen/widgets/recent_assessments.dart';
import 'package:measure_ap/presentation/screens/home_screen/widgets/recent_history.dart';
import 'package:measure_ap/presentation/screens/home_screen/widgets/top_bar.dart';
import 'package:measure_ap/presentation/widgets/custom_button.dart';
import 'package:measure_ap/utils/navigator_service.dart';
import 'package:measure_ap/utils/size.config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Widget builder(BuildContext context) {
    return const HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: CustomButton(
          onTap: () => NavigatorService.pushNamed("/new_assessment"),
          color: black600Color,
          hasShadow: true,
          child: Center(
            child: Text(
              "+ New assignment",
              style: mediumType18White,
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0XFFF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: kDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopBar(),
                SizedBox(height: 20.v),
                const RecentHistory(),
                SizedBox(height: 20.v),
                const RecentAssessments(),
                SizedBox(height: 60.v),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
