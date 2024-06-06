import 'package:flutter/material.dart';
import 'package:measure_ap/constants/color_constant.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final double? width;
  final bool hasShadow;
  final Color color;
  final bool hasBorder;

  const CustomButton(
      {super.key,
      this.width,
      required this.onTap,
      required this.color,
      required this.child,
      this.hasBorder = false,
      this.hasShadow = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 8),
        width: width,
        height: 56,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(70),
            boxShadow: _buildShadow(),
            border: hasBorder ? Border.all(color: greyBorderColor) : null),
        child: child,
      ),
    );
  }

  _buildShadow() {
    return hasShadow
        ? [
            const BoxShadow(
              color: Color(0x400753EB),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
            const BoxShadow(
              color: Color(0x40DE0000),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
            const BoxShadow(
              color: Color(0x40F88A00),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ]
        : null;
  }
}
