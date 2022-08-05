import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'dart:math';
import 'package:syncfusion_flutter_sliders/sliders.dart';

Color messageColor = Colors.green;
double sum = weight / pow(height / 100, 2);
String BMIMessage = '';

class ResultScreen extends StatefulWidget {
  ResultScreen() {
    sum = weight / pow(height / 100, 2);
    if (sum < 18.5) {
      messageColor = Colors.blue;
      BMIMessage = 'Under Weight';
    } else if (sum < 24.9) {
      messageColor = Colors.green;
      BMIMessage = 'Healthy Weight';
    } else if (sum < 29.9) {
      messageColor = Colors.orange;
      BMIMessage = 'Overweight';
    } else if (sum >= 30) {
      messageColor = Colors.red;
      BMIMessage = 'Obese';
    } else {
      BMIMessage = 'NAN';
    }
  }

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
        elevation: 0.00,
        backgroundColor: backgroundColor,
        foregroundColor: mainColor,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: ShadowContainer(
              context,
              backgroundColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'Your BMI is:',
                      style: headerTextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      sum.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 40,
                        color: messageColor,
                      ),
                    ),
                  ),
                  SfSlider(
                      min: 0.0,
                      max: 40.0,
                      interval: 5,
                      showDividers: true,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      activeColor: messageColor,
                      inactiveColor: messageColor.withAlpha(50),
                      trackShape: const SfTrackShape(),
                      value: sum > 40 ? 40 : sum,
                      onChanged: (_) {}),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      BMIMessage,
                      style: TextStyle(
                        fontSize: 40,
                        color: messageColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: ShadowContainer(
                context,
                backgroundColor,
                Center(
                  child: Text(
                    'A BMI of ${sum.toStringAsFixed(2)} indicates that your Weight is ${BMIMessage.toString()}.',
                    style: headerTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/'),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Calculate Again',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: mainColor),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.autorenew,
                      size: 45,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
