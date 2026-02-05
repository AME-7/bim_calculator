import 'package:bim_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});
  final double result;
  Status getStatus() {
    if (result < 18.5) {
      return Status('underWeight', Colors.blue);
    } else if (result <= 24.9) {
      return Status('Healthy Weight', Colors.green);
    } else if (result <= 29.9) {
      return Status('OverWeight', Colors.yellow);
    } else {
      return Status('Obese', Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.backgroundColor,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Appcolor.textcolor,
        ),
        backgroundColor: Appcolor.cardColor,
        title: Center(
          child: Text(
            'BMI Result',
            style: TextStyle(
              color: Appcolor.textcolor,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Appcolor.textcolor,
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Appcolor.cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    status(),
                    SizedBox(height: 20),
                    Text(
                      result.toStringAsFixed(2),
                      style: TextStyle(
                        color: Appcolor.textcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You Have a Normal Body Weight, Good Job',
                      style: TextStyle(color: Appcolor.textcolor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Appcolor.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Re-Calculate',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Appcolor.textcolor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget status() {
    Status status = getStatus();
    return Text(
      status.name,
      style: TextStyle(
        fontSize: 24,
        color: status.color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class Status {
  final String name;
  final Color color;

  Status(this.name, this.color);
}
