import 'package:flutter/material.dart';
import 'package:inonepage_landing/constants.dart';
import 'package:inonepage_landing/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InOnePage_Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
      },
      theme: ThemeData(
        inputDecorationTheme: kDefaultInputDecorationTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Montserrat",
      ),
    );
  }
}
