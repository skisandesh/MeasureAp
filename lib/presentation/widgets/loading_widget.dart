import 'package:flutter/material.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/utils/size.config.dart';

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
             SizedBox(
                height: 80.adaptSize,
                width: 80.adaptSize,
                child: CircularProgressIndicator(
                  strokeWidth: 20.adaptSize,
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
