import 'package:flutter/material.dart';

class detail_overview extends StatelessWidget{
  detail_overview(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 341,
        left: 16,
        right: 16,
        bottom: 503,
        child: Text(text,style: TextStyle(fontSize: 14,letterSpacing: -0.015,color: Color(0xff828282)),)
    );
  }
}