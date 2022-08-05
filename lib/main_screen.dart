import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

var isMale = true;
var age = 18;
double height = 150;
var weight = 70;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        foregroundColor: mainColor,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          textAlign: TextAlign.center,
          style: headerTextStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                ExpandedButton('Male'),
                ExpandedButton('Female'),
              ],
            ),
            //Height Container
            Expanded(
              flex: 3,
              child: ShadowContainer(
                  context,
                  backgroundColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Height',
                        style: headerTextStyle,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Slider(
                          divisions: 30,
                          min: 70.0,
                          max: 220.0,
                          value: height,
                          label: height.toStringAsFixed(0),
                          onChanged: (dynamic value) {
                            setState(() {
                              height = value;
                            });
                          },
                        ),
                      ),
                      Text(
                        'You are ${height.toStringAsFixed(0)} Centimeters tall',
                        style: headerTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
            ),
            //Weight & Age Containers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: ShadowContainer(
                    context,
                    backgroundColor,
                    Column(
                      children: [
                        const Text(
                          'Weight (KG)',
                          style: headerTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        NumberPicker(
                          step: 1,
                          minValue: 40,
                          maxValue: 300,
                          value: weight,
                          onChanged: (w) => setState(
                            () {
                              weight = w;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ShadowContainer(
                    context,
                    backgroundColor,
                    Column(
                      children: [
                        const Text(
                          'Age',
                          style: headerTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        NumberPicker(
                          step: 1,
                          minValue: 10,
                          maxValue: 130,
                          value: age,
                          onChanged: (a) => setState(
                            () {
                              age = a;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/result'),
                  child: const Center(
                    child: Text(
                      'Calculate BMI',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: mainColor),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded ExpandedButton(String type) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: () {
          setState(() {
            type == 'Male' ? isMale = true : isMale = false;
          });
        },
        child: ShadowContainer(
          context,
          isMale == true && type == 'Male' ||
                  isMale == false && type == 'Female'
              ? mainColor
              : backgroundColor,
          Column(
            children: [
              Icon(type == 'Male' ? Icons.male : Icons.female),
              Text(
                type,
                style: headerTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShadowContainer extends StatelessWidget {
  ShadowContainer(this.ctx, this.borderColor, this.child);
  Color borderColor;
  Widget child;
  BuildContext ctx;
  @override
  Widget build(ctx) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: borderColor, width: 6),
        boxShadow: [
          BoxShadow(
            color: borderColor == mainColor
                ? mainColor.withOpacity(0.5)
                : Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
