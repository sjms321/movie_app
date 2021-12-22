import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Movie{
  late int id;
  late String image;
  late String title;
  late double vote_average;



  Movie({
    required this.id,
    required this.image,
    required this.title,
    required this.vote_average,
  });
}



Future<List<Movie>> get_nowplaying() async{
  var url = Uri.https('api.themoviedb.org', '/3/movie/now_playing', {'q': '{http}','api_key':'cc31252f1eac3f1387dc62e98f8d4425','language':'en-US'});

  Response response;

  var data1;


  response = await http.get(url);
  data1 = json.decode(response.body);

  List<Movie>  movies= [];

  for(int i=0;i<data1["results"].length;i++){
    movies.add(
        Movie(
          id:  data1["results"].elementAt(i)["id"],
          title: data1["results"].elementAt(i)["title"],
          image: data1["results"].elementAt(i)["poster_path"],
          vote_average: data1["results"].elementAt(i)["vote_average"],
        )
    );
  }

  return movies;
}