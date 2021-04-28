import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constratinsts) {
      if (constratinsts.maxWidth > 600) {
        return DesktopFooterSection();
      } else {
        return MobileFooterSection();
      }
    });
  }
}

class DesktopFooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Container(
        // constraints: BoxConstraints(maxWidth: 1200),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            "Written in ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w100,
            ),
          ),
          Center(
              child: TextButton(
            style: TextButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.zero,
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Image.asset(
                "assets/images/flutter_logo.png",
                width: 25,
                height: 25,
              ),
              Text(
                "Flutter",
                style: TextStyle(color: Colors.grey),
              ),
            ]),
            onPressed: _launchFlutter,
          )),
          Text(
            ", Copyright © 2021 ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w100,
            ),
          ),
          Text(
            "Inwon Han",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            ". All rights reserved.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w100,
            ),
          ),
        ]),
      ),
    );
  }
}

class MobileFooterSection extends StatelessWidget {
  const MobileFooterSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Container(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Written in ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w100,
                ),
              ),
              Column(children: [
                TextButton(
                  style: TextButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Image.asset(
                      "assets/images/flutter_logo.png",
                      width: 20.5,
                      height: 20.5,
                    ),
                    Text(
                      "Flutter",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ]),
                  onPressed: _launchFlutter,
                ),
              ]),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Copyright © 2021 ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w100,
                ),
              ),
              Text(
                "Inwon Han",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ". All rights reserved.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

_launchFlutter() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
