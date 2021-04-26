import 'package:flutter/material.dart';
import 'package:inonepage_landing/widgets/animation_logo.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 80),
      child: Container(
        // constraints: BoxConstraints(maxWidth: 1200),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AnimationLogo(),
              Row(children: <Widget>[
                TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      padding: EdgeInsets.all(0.0),
                    ),
                    onPressed: () {},
                    child: Image.asset('assets/images/youtube_play.png')),
                TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      padding: EdgeInsets.all(0.0),
                    ),
                    onPressed: () {},
                    child: Image.asset('assets/images/github_square.png')),
                TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      padding: EdgeInsets.all(0.0),
                    ),
                    onPressed: () {},
                    child: Image.asset('assets/images/linkedin_rect.png')),
              ]),
            ]),
      ),
    );
  }
}
