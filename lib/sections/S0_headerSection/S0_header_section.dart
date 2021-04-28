import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:inonepage_landing/widgets/animation_logo.dart';
import 'package:url_launcher/url_launcher.dart';

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
                AvatarGlow(
                  glowColor: Colors.white,
                  endRadius: 40.0,
                  duration: Duration(milliseconds: 4000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 100),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: _launchYoutube,
                      child: Image.asset('assets/images/youtube_play.png')),
                ),
                AvatarGlow(
                  glowColor: Colors.white,
                  endRadius: 40.0,
                  duration: Duration(milliseconds: 4000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 100),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: _launchGithub,
                      child: Image.asset('assets/images/github_square.png')),
                ),
                AvatarGlow(
                  glowColor: Colors.white,
                  endRadius: 40.0,
                  duration: Duration(milliseconds: 4000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 100),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: _launchLinkedIn,
                      child: Image.asset('assets/images/linkedin_rect.png')),
                ),
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
                      AvatarGlow(
                        glowColor: Colors.white,
                        endRadius: 40.0,
                        duration: Duration(milliseconds: 4000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 100),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.all(0.0),
                            ),
                            onPressed: _launchYoutube,
                            child:
                                Image.asset('assets/images/youtube_play.png')),
                      ),
                      AvatarGlow(
                        glowColor: Colors.white,
                        endRadius: 40.0,
                        duration: Duration(milliseconds: 4000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 100),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.all(0.0),
                            ),
                            onPressed: _launchGithub,
                            child:
                                Image.asset('assets/images/github_square.png')),
                      ),
                      AvatarGlow(
                        glowColor: Colors.white,
                        endRadius: 40.0,
                        duration: Duration(milliseconds: 4000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 100),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.all(0.0),
                            ),
                            onPressed: _launchLinkedIn,
                            child:
                                Image.asset('assets/images/linkedin_rect.png')),
                      ),
                    ]),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

_launchYoutube() async {
  const url = 'https://www.youtube.com/channel/UCMA0bvN4WhuDCRvZzDx4qcQ';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchGithub() async {
  const url = 'https://github.com/WayneInwonHan';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchLinkedIn() async {
  const url = 'https://www.linkedin.com/in/wayne-inwon-han';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
