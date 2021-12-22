import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/constrants/api_constants.dart';

class Main_Actor {
  late String name;
  late String image;

  Main_Actor({
    required this.name,
    required this.image,
  });
}



Future<List<Main_Actor>> get_actors(int movie_id) async {

  var url = Uri.https(TMDB_API_BASE_URL, '/3/movie/${movie_id}/credits', {'q': '{http}','api_key':TMDB_API_KEY,'language':'en-US'});

  Response response;

  var data1;

  response = await http.get(url);
  if(response.statusCode==200){
    data1 = json.decode(response.body);

    List<Main_Actor> actors = [];

    for (int i = 0;i< data1["cast"].length;i++) {
      actors.add(
          Main_Actor(
            name:data1["cast"].elementAt(i)["name"],
            image:data1["cast"].elementAt(i)["profile_path"],
          )
      );

    }


    return actors;
  }else{
    throw Exception("error!");
  }

}
