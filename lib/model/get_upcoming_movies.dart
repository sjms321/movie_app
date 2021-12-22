import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class UpMovie {
  late int id;
  late String image;
  late String title;
  late double vote_average;
  late List<dynamic> genres;
  late String release_date;

  UpMovie({
    required this.id,
    required this.image,
    required this.title,
    required this.vote_average,
    required this.genres,
    required this.release_date,
  });
}



Future<List<UpMovie>> get_upcomming() async {

  //개봉예정작작
 var apiAddr =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=cc31252f1eac3f1387dc62e98f8d4425&language=en-US&page=1';
  Response response; //http request의 결과 즉 api 호출의 결과를 받기 위한 변수

  var data1; //api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.

  response = await http.get(apiAddr); //필요 api 호출
  data1 = json.decode(response.body); //받은 정보를 json형태로 decode

  List<UpMovie> movies = [];

  for (int i = 0;i<3;i++) {
    movies.add(UpMovie(
      id: data1["results"].elementAt(i)["id"],
      title: data1["results"].elementAt(i)["title"],
      image: data1["results"].elementAt(i)["poster_path"],
      vote_average: data1["results"].elementAt(i)["vote_average"],
      release_date: data1["results"].elementAt(i)["release_date"],
      genres: data1["results"].elementAt(i)["genre_ids"],
    ));
  }

  return movies;
}
