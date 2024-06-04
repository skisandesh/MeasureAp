import 'package:flutter/material.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/presentation/screens/home_screen/widgets/recent_assessments.dart';
import 'package:measure_ap/presentation/screens/home_screen/widgets/recent_history.dart';
import 'package:measure_ap/presentation/screens/home_screen/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Widget builder(BuildContext context) {
    return const HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0XFFF4F4F4),
      body: SafeArea(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
