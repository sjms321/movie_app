import 'package:flutter/cupertino.dart';

class home_text extends StatelessWidget{
  home_text(this.left,this.top,this.text);
  final double top;
  final double left;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        child: Text(
          text,
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),);
  }
}