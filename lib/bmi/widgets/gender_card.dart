import 'package:bim_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });
  final String text;
  final IconData icon;
  final Function() onTap;
  final bool isSelected;
  Color getColor() {
    if (isSelected) {
      return Appcolor.primaryColor;
    } else {
      return Appcolor.cardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: getColor(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Appcolor.textcolor, size: 90),
              Text(text, style: TextStyle(color: Appcolor.textcolor)),
            ],
          ),
        ),
      ),
    );
  }
}
