import 'package:flutter/material.dart';

class detail_subtitle_text extends StatelessWidget {
  detail_subtitle_text(this.left, this.top, this.text);
  final double top;
  final double left;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ));
  }
}
