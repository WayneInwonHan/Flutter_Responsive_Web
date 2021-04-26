import 'dart:math';
import 'package:inonepage_landing/sections/S0_headerSection/S0_header_section.dart';
import 'package:inonepage_landing/sections/S1_landingSection/S1_landing_section.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(45, 0, 70, 1.0),
                Color.fromRGBO(0, 0, 0, 1.0)
              ]),
        ),
        child: Stack(children: [
          onBottom(AnimatedWave(
            height: 300, //150
            speed: 0.7,
          )),
          onBottom(AnimatedWave(
            height: 250, //120
            speed: 0.6,
            offset: pi,
          )),
          onBottom(AnimatedWave(
            height: 400, //200
            speed: 0.9,
            offset: pi / 2,
          )),
          onBottom(AnimatedWave(
            height: 650, //200
            speed: 0.4,
            offset: pi / 2,
          )),
          SingleChildScrollView(
            child: Column(children: <Widget>[
              HeaderSection(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 30.0),
                child: LandingPage(),
              ),
              SizedBox(height: 200),
            ]),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        heroTag: "star",
        onPressed: () {},
        splashColor: Colors.white,
        hoverColor: Colors.grey.withOpacity(.25),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.star,
          color: Color.fromRGBO(45, 0, 70, 1.0),
        ),
      ),
    );
  }

  Widget onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
}

class AnimatedWave extends StatelessWidget {
  final double height;
  final double speed;
  final double offset;

  AnimatedWave({this.height, this.speed, this.offset = 0.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: height,
        width: constraints.biggest.width,
        child: LoopAnimation<double>(
            duration: (5000 / speed).round().milliseconds,
            tween: 0.0.tweenTo(2 * pi),
            builder: (context, child, value) {
              return CustomPaint(
                foregroundPainter: CurvePainter(value + offset),
              );
            }),
      );
    });
  }
}

class CurvePainter extends CustomPainter {
  final double value;

  CurvePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()..color = Colors.white.withAlpha(20);
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(
        size.width * 0.5, controlPointY, size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
