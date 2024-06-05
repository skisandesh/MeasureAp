import 'package:flutter/material.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/presentation/screens/home_screen/widgets/recent_assessments.dart';
import 'package:measure_ap/presentation/screens/home_screen/widgets/recent_history.dart';
import 'package:measure_ap/presentation/screens/home_screen/widgets/top_bar.dart';
import 'package:measure_ap/presentation/widgets/custom_button.dart';
import 'package:measure_ap/utils/navigator_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Widget builder(BuildContext context) {
    return const HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
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
      backgroundColor: const Color(0XFFF4F4F4),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: kDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(),
                SizedBox(height: 20),
                RecentHistory(),
                SizedBox(height: 20),
                RecentAssessments(),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
