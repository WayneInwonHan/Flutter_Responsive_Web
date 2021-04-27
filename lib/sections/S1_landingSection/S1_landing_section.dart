import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPage createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Howdy! | Annyeong",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat",
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.all(0.0)),
            Text(
              "My name's Inwon Han",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 50.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/wayne_main_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                )),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Text(
              "New York & Me, 2016",
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.white,
                fontFamily: "Montserrat",
              ),
            ),
          ],
        ),
      )
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
          children: pageChildren(constratinsts.biggest.width),
        );
      }
    });
  }
}
