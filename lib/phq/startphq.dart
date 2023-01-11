import 'package:flutter/material.dart';
import 'package:saveorsob/phq/phq9.dart';

class startphq extends StatefulWidget {
  @override
  _startphqState createState() => _startphqState();
}

class _startphqState extends State<startphq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade300,
        title: Text(
          'Detect Suicidal Intent',
          style: TextStyle(color: Color(0xff2b2d70), fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(1, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: Text(
                              "What is PHQ - 9 ?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("✦  "),
                                Expanded(
                                    child: Text(
                                  "The Patient Health Questionnaire (PHQ)-9 is the major depressive disorder (MDD) module of the full PHQ.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 8, right: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("✦  "),
                                Expanded(
                                    child: Text(
                                  "Used to provisionally diagnose depression and grade severity of symptoms in general medical and mental health settings.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(1, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Text(
                            "Before Starting PHQ - 9",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("✦  "),
                              Expanded(
                                child: Text(
                                  "Over the last two weeks, how often have you been bothered by any of the following problems? ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            "Answer by starting the quiz",
                            style: TextStyle(
                                color: Color(0xff2b2d70),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff4c2c87)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => phq9()));
                    },
                    child: Text(
                      "Start PHQ-9",
                      style: TextStyle(fontSize: 16),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
