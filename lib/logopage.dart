import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:saveorsob/home.dart';
import 'package:saveorsob/logo_content.dart';
import 'package:saveorsob/constants.dart';

class LogoPage extends StatefulWidget {
  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 8, top: 5),
                alignment: Alignment.topRight,
              ),
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  // itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    text: 'Hi, How are you feeling today',
                    image: "assets/images/saveosob.png",
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  // padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
                  child: Column(
                    children: [
                      Spacer(
                        flex: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // List.generate(
                          //   splashData.length,
                          //   (index) => buildDot(index: index),
                          // )
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        // height: getScreenHeight(50),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0xff2596be),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          child: Text(
                            "New user? Sign Up",
                            style: TextStyle(
                                fontSize: 18,
                                // fontSize: getScreenWidth(18),
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        // height: getScreenHeight(50),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0xff4c2c87),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          child: Text(
                            "Already Registered? Login",
                            style: TextStyle(
                                fontSize: 18,
                                // fontSize: getScreenWidth(18),
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? Color(0xff2596be) : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
