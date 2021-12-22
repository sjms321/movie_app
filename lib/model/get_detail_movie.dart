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


class Detail_Movie {
  late String title;
  late String backdrop;
  late String poster;
  late bool adult;
  late List<dynamic> genres;
  late String release_date;
  late double vote_average;
  late String overview;





  Detail_Movie({
    required this.poster,
    required this.backdrop,
    required this.title,
    required this.vote_average,
    required this.genres,
    required this.release_date,
    required this.adult,
    required this.overview
  });
}



Future<Detail_Movie> get_detail(int movie_id) async {

  //개봉예정작작
  var apiAddr =
      'https://api.themoviedb.org/3/movie/${movie_id}?api_key=cc31252f1eac3f1387dc62e98f8d4425&append_to_response=credits&language=ko';
  Response response; //http request의 결과 즉 api 호출의 결과를 받기 위한 변수

  var data1; //api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.

  response = await http.get(apiAddr); //필요 api 호출
  data1 = json.decode(response.body); //받은 정보를 json형태로 decode

  Detail_Movie detail_movie = Detail_Movie(
      title: data1["title"],
      backdrop: data1["backdrop_path"],
      poster: data1["poster_path"],
      vote_average: data1["vote_average"],
      release_date: data1["release_date"],
      genres: data1["genres"],
      adult: data1["adult"],
      overview: data1["overview"]
  );


  return detail_movie;
}
