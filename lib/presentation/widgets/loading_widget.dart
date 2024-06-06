import 'package:flutter/material.dart';
import 'package:measure_ap/constants/export_constants.dart';

class LoadingWidget extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return const LoadingWidget();
  }

  const LoadingWidget({super.key});



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
