import 'package:bim_calculator/bmi/page/result_screen.dart';
import 'package:bim_calculator/bmi/widgets/counter_card.dart';
import 'package:bim_calculator/bmi/widgets/gender_card.dart';
import 'package:bim_calculator/bmi/widgets/height_card.dart';
import 'package:bim_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int weight = 60;
  int age = 22;
  int height = 170;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.backgroundColor,
      appBar: AppBar(
        backgroundColor: Appcolor.backgroundColor,
        title: Center(
          child: Text(
            'BIM Calculator',
            style: TextStyle(color: Appcolor.textcolor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          spacing: 16,
          children: [
            genderSelectoin(),
            HeightCard(
              height: height,
              onChange: (value) {
                setState(() {
                  height = value.toInt();
                });
              },
            ),
            weightAndAge(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolor.primaryColor,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
              ),
              onPressed: () {
                double result = weight / (height * height / 10000);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(result: result),
                  ),
                );
              },
              child: Text(
                'calculate',
                style: TextStyle(color: Appcolor.textcolor, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded genderSelectoin() {
    return Expanded(
      child: Row(
        spacing: 16,
        children: [
          GenderCard(
            isSelected: isMale,
            text: 'male',
            icon: Icons.male,
            onTap: () {
              setState(() {
                isMale = true;
              });
            },
          ),
          GenderCard(
            isSelected: !isMale,
            text: 'female',
            icon: Icons.female,
            onTap: () {
              setState(() {
                isMale = false;
              });
            },
          ),
        ],
      ),
    );
  }

  Expanded weightAndAge() {
    return Expanded(
      child: Row(
        spacing: 16,
        children: [
          CounterCard(
            text: 'Weight',
            num: weight,
            onAdd: () {
              setState(() {
                weight++;
              });
            },
            onRemove: () {
              if (weight > 16) {
                setState(() {
                  weight--;
                });
              }
            },
          ),
          CounterCard(
            text: 'Age',
            num: age,
            onAdd: () {
              setState(() {
                age++;
              });
            },
            onRemove: () {
              if (age > 10) {
                setState(() {
                  age--;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
