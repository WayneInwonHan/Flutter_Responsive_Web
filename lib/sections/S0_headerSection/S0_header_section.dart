import 'package:flutter/material.dart';
import 'package:inonepage_landing/widgets/animation_logo.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constratinsts) {
      if (constratinsts.maxWidth > 1200) {
        return DesktopHeaderSection();
      } else if (constratinsts.maxWidth > 800 &&
          constratinsts.maxWidth < 1200) {
        return DesktopHeaderSection();
      } else {
        return MobileHeaderSection();
      }
    });
  }
}

class DesktopHeaderSection extends StatelessWidget {
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

class MobileHeaderSection extends StatelessWidget {
  const MobileHeaderSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AnimationLogo(),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                          child:
                              Image.asset('assets/images/github_square.png')),
                      TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          child:
                              Image.asset('assets/images/linkedin_rect.png')),
                    ]),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
