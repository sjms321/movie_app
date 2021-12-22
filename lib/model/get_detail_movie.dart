import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/constrants/api_constants.dart';


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
  var url = Uri.https(TMDB_API_BASE_URL, '/3/movie/${movie_id}', {'q': '{http}','api_key':TMDB_API_KEY,'language':'ko','append_to_response':'credits'});

  Response response;

  var data1;
  response = await http.get(url);
  data1 = json.decode(response.body);

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
