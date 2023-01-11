import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String? answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      child: RaisedButton(
        shape: new OutlineInputBorder(
          // borderSide: BorderSide(color: Colors.grey[600]),
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white70,
        //kPrimaryColor.withOpacity(0.9),
        textColor: Colors.black,

        highlightColor: Colors.green.shade400,

        child: Text(answerText!),
        onPressed: selectHandler,
      ), //RaisedButton
    ); //Container
  }
}
