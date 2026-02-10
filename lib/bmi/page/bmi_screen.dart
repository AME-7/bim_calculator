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
          children: [
            Expanded(
              child: Row(
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
                  const SizedBox(width: 16),
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
            ),
            const SizedBox(height: 16),
            HeightCard(
              height: height,
              onChange: (value) {
                setState(() {
                  height = value.toInt();
                });
              },
            ),
            const SizedBox(height: 16),
            WeightAndAgeSection(
              weight: weight,
              age: age,
              onWeightAdd: () => setState(() {
                weight++;
              }),
              onWeightRemove: () => setState(() {
                if (weight > 16) weight--;
              }),
              onAgeAdd: () => setState(() {
                age++;
              }),
              onAgeRemove: () => setState(() {
                if (age > 10) age--;
              }),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolor.primaryColor,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
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
}

class WeightAndAgeSection extends StatelessWidget {
  final int weight;
  final int age;
  final VoidCallback onWeightAdd;
  final VoidCallback onWeightRemove;
  final VoidCallback onAgeAdd;
  final VoidCallback onAgeRemove;

  const WeightAndAgeSection({
    super.key,
    required this.weight,
    required this.age,
    required this.onWeightAdd,
    required this.onWeightRemove,
    required this.onAgeAdd,
    required this.onAgeRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          CounterCard(
            text: 'Weight',
            num: weight,
            onAdd: onWeightAdd,
            onRemove: onWeightRemove,
          ),
          const SizedBox(width: 16),
          CounterCard(
            text: 'Age',
            num: age,
            onAdd: onAgeAdd,
            onRemove: onAgeRemove,
          ),
        ],
      ),
    );
  }
}
