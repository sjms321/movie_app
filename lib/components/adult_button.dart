import 'package:flutter/material.dart';

class adult_buttton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 27,
      height: 12,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0xffF76060)),
          borderRadius: BorderRadius.circular(2)),
      child: Center(
          child: Text(
        "adult",
        style: TextStyle(
            fontSize: 7, fontWeight: FontWeight.bold, color: Color(0xffF76060)),
      )),
    );
  }
}
