import "package:flutter/material.dart";

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "Detect Suicidal Intent...",
          style: TextStyle(
            fontSize: 24,
            color: Color(0xff2596be),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: 300,
          width: 300,
        )
      ],
    );
  }
}
