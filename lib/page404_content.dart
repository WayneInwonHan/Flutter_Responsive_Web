import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class NotFoundContent extends StatefulWidget {
  @override
  _NotFoundContent createState() => _NotFoundContent();
}

class _NotFoundContent extends State<NotFoundContent> {
  double x;
  double y;

  @override
  void initState() {
    super.initState();

    x = -100;
    y = -100;
  }

  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "404 ERROR",
              style: TextStyle(
                fontSize: 75.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
            Row(children: [
              Text(
                "MEOW NOT FOUND",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                horizontal: 15,
              )),
            ]),
            Text(
              "Our cats have been nibbling the cables again.",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
            ),
            Row(children: [
              Text(
                "Maybe this will help ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.transparent,
                  padding: EdgeInsets.all(0.0),
                ),
                onPressed: () {
                  html.window.location.replace('https://waynehan.com');
                },
                child: Text(
                  "HOME",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 15.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 50,
        ),
        child: Column(
          children: [
            Container(
              width: width / 1.5,
              height: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/notfound404_cat.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constratinsts) {
      if (constratinsts.maxWidth > 800) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pageChildren(constratinsts.biggest.width / 2),
        );
      } else {
        return Column(
          children: pageChildren(constratinsts.biggest.width / 1.25),
        );
      }
    });
  }
}
