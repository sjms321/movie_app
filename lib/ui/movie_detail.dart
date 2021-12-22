import 'package:flutter/material.dart';

class movie_detail extends StatefulWidget {
  @override
  _movie_detail createState() => _movie_detail();
}

class _movie_detail extends State<movie_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Container(
              child: Text("별점 제목사진"),
            ),
          ),

          Container(
            child: Container(
              child: Text("개요"),
            ),
          ),

          Container(
            child: Container(
              child: Text("주요출연진"),
            ),
          ),
          
          Container(
            child: Container(
              child: Text("리뷰"),
            ),
          ),
        ],
      ),
    );
  }

}