import 'package:flutter/material.dart';
import 'package:movie_app/components/home_text.dart';
import 'package:movie_app/components/now_playing.dart';
import 'package:movie_app/components/specially_three_movie.dart';

class home_movie_list extends StatefulWidget {
  @override
  _home_movie_list createState() => _home_movie_list();
}

class _home_movie_list extends State<home_movie_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            height: 1250,
            child: Stack(
              children: [
                home_text(16, 43, "현재 상영중"),
                now_playing(),
                home_text(16, 325, "개봉예정"),
                specially_three_movie(
                  top: 371,
                  left: 16,
                  special: "upcoming",
                ),
                home_text(16, 618, "인기"),
                specially_three_movie(top: 664, left: 16, special: "popular"),
                home_text(16, 911, "높은 평점"),
                specially_three_movie(
                  top: 957,
                  left: 16,
                  special: "top_rated",
                ),
              ],
            ),
          )),
    );
  }
}
