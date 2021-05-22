import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LabeledData extends StatelessWidget {
  final String label;
  final String text;

  LabeledData({this.label = "", this.text = ""});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
        text: TextSpan(
            text: "${this.label}: ",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16, ),
            children: [
          TextSpan(
              text: this.text,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14))
        ]));
  }
}
