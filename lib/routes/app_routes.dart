
import 'package:flutter/material.dart';
import 'package:measure_ap/presentation/screens/home_container/home_container.dart';
import 'package:measure_ap/presentation/screens/home_screen/home_screen.dart';

class AppRoutes {
  static const String homeContainerScreen = '/home_container_screen';
  static const String homeScreen = '/home_screen';


  static Map<String, WidgetBuilder> get routes => {
        homeContainerScreen: HomeContainerScreen.builder,
        homeScreen: HomeScreen.builder

      };
}
