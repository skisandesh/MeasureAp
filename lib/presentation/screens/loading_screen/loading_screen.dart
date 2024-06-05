import 'package:flutter/material.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/utils/navigator_service.dart';

class LoadingScreen extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return const LoadingScreen();
  }

  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      NavigatorService.popAndPushNamed("/assessment");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  strokeWidth: 20,
                )),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Loading assessment",
              style: semiBoldType16,
            )
          ],
        ),
      ),
    );
  }
}
