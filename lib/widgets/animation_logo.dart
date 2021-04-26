import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class AnimationLogo extends StatelessWidget {
  static final boxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 50,
            offset: Offset(5, 5),
            spreadRadius: 2),
      ]);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Transform.translate(
        offset: Offset(25, 15),
        child: Container(
          width: 300,
          height: 65,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
        ),
      ),
      Container(
        child: PlayAnimation<double>(
          duration: 400.milliseconds,
          tween: 0.0.tweenTo(80.0),
          builder: (context, child, height) {
            return PlayAnimation<double>(
              duration: 1200.milliseconds,
              delay: 1000.milliseconds,
              tween: 2.0.tweenTo(300.0),
              builder: (context, child, width) {
                return TextButton(
                  style: TextButton.styleFrom(
                      primary: Color.fromRGBO(45, 0, 70, 1.0)),
                  onPressed: () {
                    html.window.location.reload();
                  },
                  child: Container(
                    decoration: boxDecoration,
                    width: width,
                    height: height * 0.75,
                    child: isEnoughRoomForTypewriter(width)
                        ? TypewriterText("In One Page")
                        : Container(),
                  ),
                );
              },
            );
          },
        ),
      ),
    ]);
  }

  bool isEnoughRoomForTypewriter(double width) => width > 30;
}

class TypewriterText extends StatelessWidget {
  static const TEXT_STYLE = TextStyle(
      letterSpacing: 4,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: "Montserrat");

  final String text;

  TypewriterText(this.text);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<int>(
        duration: 800.milliseconds,
        delay: 800.milliseconds,
        tween: 0.tweenTo(text.length),
        builder: (context, child, textLength) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text.substring(0, textLength), style: TEXT_STYLE),
              _blinkingCursor()
            ],
          );
        });
  }

  Widget _blinkingCursor() {
    return LoopAnimation<int>(
      duration: 600.milliseconds,
      tween: 0.tweenTo(1),
      builder: (context, child, oneOrZero) {
        return Opacity(
            opacity: oneOrZero == 1 ? 1.0 : 0.0,
            child: Text("_", style: TEXT_STYLE));
      },
    );
  }
}
