import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/constrants/api_constants.dart';

class Review {
  late String author;
  late String content;

  Review({
    required this.author,
    required this.content,
  });
}

Future<List<Review>> get_reviews(int movie_id) async {
  var url = Uri.https(TMDB_API_BASE_URL, '/3/movie/${movie_id}/reviews', {
    'q': '{http}',
    'api_key': TMDB_API_KEY,
    'language': 'en-US',
    'page': '1'
  });

  Response response;

  var data1;

  response = await http.get(url);
  if (response.statusCode == 200) {
    data1 = json.decode(response.body);

    List<Review> reviews = [];

    for (int i = 0; i < data1["results"].length; i++) {
      reviews.add(Review(
        author: data1["results"].elementAt(i)["author"],
        content: data1["results"].elementAt(i)["content"],
      ));
    }

    return reviews;
  } else {
    throw Exception("error!");
  }
}
