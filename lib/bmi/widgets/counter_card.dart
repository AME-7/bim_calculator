import 'package:bim_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  const CounterCard({
    super.key,
    required this.text,
    required this.num,
    required this.onAdd,
    required this.onRemove,
  });
  final String text;
  final int num;
  final Function() onAdd;
  final Function() onRemove;
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
          spacing: 5,
          children: [
            Text(
              text,
              style: TextStyle(color: Appcolor.textcolor, fontSize: 18),
            ),
            Text(
              num.toString(),
              style: TextStyle(
                color: Appcolor.textcolor,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: onRemove,
                  icon: Icon(Icons.remove, color: Appcolor.textcolor),
                ),
                IconButton.filled(
                  onPressed: onAdd,
                  icon: Icon(Icons.add, color: Appcolor.textcolor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
