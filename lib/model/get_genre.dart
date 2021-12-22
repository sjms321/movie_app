import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/constrants/api_constants.dart';

Future<String> get_genre(List<int> genre_ids) async {
  var url = Uri.https(TMDB_API_BASE_URL, '/3/genre/movie/list',
      {'q': '{http}', 'api_key': TMDB_API_KEY, 'language': 'en-US'});

  Response response;
  var data1;
  response = await http.get(url);
  if (response.statusCode == 200) {
    data1 = json.decode(response.body);

    String genres = "";

    for (int i = 0; i < genre_ids.length; i++) {
      for (int j = 0; j < data1["genres"].length; j++) {
        if (data1["genres"].elementAt(j)["id"] == genre_ids.elementAt(i)) {
          genres = genres + data1["genres"].elementAt(i)["name"] + ", ";
        }
      }
    }

    return genres.substring(0, genres.length - 2);
  } else {
    throw Exception("error!");
  }
}
