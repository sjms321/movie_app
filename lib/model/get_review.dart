import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

//제목   0
//포스터 0
//adult 0
//장르   0
//발매일  0
//평정    0
//overview 0
//출연진?


//리뷰


class Review {
  late String author;
  late String content;

  Review({
    required this.author,
    required this.content,

  });
}



Future<List<Review>> get_reviews(int movie_id) async {

  //개봉예정작작
  var apiAddr =
      'https://api.themoviedb.org/3/movie/${movie_id}/reviews?api_key=cc31252f1eac3f1387dc62e98f8d4425&language=en-US&page=1';
  Response response; //http request의 결과 즉 api 호출의 결과를 받기 위한 변수

  var data1; //api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.

  response = await http.get(apiAddr); //필요 api 호출
  data1 = json.decode(response.body); //받은 정보를 json형태로 decode

  List<Review> reviews = [];

  for (int i = 0;i<data1["results"].length;i++) {
    reviews.add(Review(
      author : data1["results"].elementAt(i)["author"],
      content:  data1["results"].elementAt(i)["content"],
    ));
  }

  return reviews;
}