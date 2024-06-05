
import 'package:flutter/material.dart';
import 'package:measure_ap/presentation/screens/assessment_screen/assessment_screen.dart';
import 'package:measure_ap/presentation/screens/home_container/home_container.dart';
import 'package:measure_ap/presentation/screens/home_screen/home_screen.dart';
import 'package:measure_ap/presentation/screens/new_assessment_screen/new_assessment_screen.dart';

class AppRoutes {
  static const String homeContainerScreen = '/home_container_screen';
  static const String homeScreen = '/home_screen';
  static const String newAssessmentScreen = '/new_assessment';
  static const String assessmentScreen = '/assessment';


  static Map<String, WidgetBuilder> get routes => {
        homeContainerScreen: HomeContainerScreen.builder,
        homeScreen: HomeScreen.builder,
        newAssessmentScreen: NewAssessmentScreen.builder,
        assessmentScreen: AssessmentScreen.builder,

      };
}
