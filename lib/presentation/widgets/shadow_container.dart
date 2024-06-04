import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;
  const ShadowContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
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
