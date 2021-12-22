import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Main_Actor {
  late String name;
  late String image;

  Main_Actor({
    required this.name,
    required this.image,
  });
}



Future<List<Main_Actor>> get_actors(int movie_id) async {

  var url = Uri.https('api.themoviedb.org', '/3/movie/${movie_id}/credits', {'q': '{http}','api_key':'cc31252f1eac3f1387dc62e98f8d4425','language':'en-US'});

  Response response;

  var data1;

  response = await http.get(url);
  data1 = json.decode(response.body);

  List<Main_Actor> actors = [];

  for (int i = 0;i< data1["cast"].length;i++) {
      actors.add(
          Main_Actor(
        name:data1["cast"].elementAt(i)["name"],
        image:data1["cast"].elementAt(i)["profile_path"],
      )
    );

    print(actors.elementAt(0).name);
  }


  return actors;
}
