import 'package:bim_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class HeightCard extends StatelessWidget {
  const HeightCard({super.key, required this.height, required this.onChange});
  final int height;
  final Function(double) onChange;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Appcolor.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Height',
              style: TextStyle(color: Appcolor.textcolor, fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toString(),
                  style: TextStyle(
                    color: Appcolor.textcolor,
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'cm',
                  style: TextStyle(color: Appcolor.textcolor, fontSize: 18),
                ),
              ],
            ),
            Slider(
              value: height.toDouble(),
              min: 80,
              max: 220,
              activeColor: Appcolor.primaryColor,
              inactiveColor: Appcolor.grayColor,
              onChanged: onChange,
            ),
          ],
        ),
      ),
    );
  }
}
