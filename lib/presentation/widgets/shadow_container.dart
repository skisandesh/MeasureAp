import 'package:flutter/material.dart';
import 'package:measure_ap/utils/size.config.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;
  const ShadowContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(12.adaptSize),
      margin:  EdgeInsets.only(bottom: 12.v),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            offset: Offset(0, 21),
            blurRadius: 18.8,
            spreadRadius: -19,
          ),
        ],
      ),
      child: child,
    );
  }
}
