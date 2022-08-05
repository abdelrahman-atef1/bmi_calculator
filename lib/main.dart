import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'result_screen.dart';

void main() {
  runApp(const MyApp());
}

const mainColor = Colors.indigo; //Color.fromARGB(255, 75, 125, 249);
const backgroundColor = Color.fromARGB(255, 250, 250, 250);
const headerTextStyle = TextStyle(
  color: mainColor,
  fontSize: 18,
  fontWeight: FontWeight.bold,
  fontFamily: 'Nunito',
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: const Color.fromARGB(255, 75, 125, 249),
        iconTheme: const IconThemeData(
          size: 70,
          color: mainColor,
        ),
        //fontFamily: 'Spantaran',
      ),
      home: const MainScreen(),
      initialRoute: '/',
      routes: {'/result': (context) => ResultScreen()},
    );
  }
}
