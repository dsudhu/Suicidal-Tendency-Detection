import 'package:flutter/material.dart';
import 'package:saveorsob/logopage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaveOrSob',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogoPage(),
    );
  }
}
