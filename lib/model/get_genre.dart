import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;



Future<String> get_genre(List<int> genre_ids) async {

  //개봉예정작작
  var apiAddr =
      'https://api.themoviedb.org/3/genre/movie/list?api_key=cc31252f1eac3f1387dc62e98f8d4425&language=en-US';
  Response response; //http request의 결과 즉 api 호출의 결과를 받기 위한 변수
  var data1; //api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.
  response = await http.get(apiAddr); //필요 api 호출
  data1 = json.decode(response.body); //받은 정보를 json형태로 decode



  String genres = "";

  for (int i = 0;i<genre_ids.length;i++) {
    for(int j = 0; j<data1["genres"].length;j++){
      if(data1["genres"].elementAt(j)["id"]==genre_ids.elementAt(i)){
        genres = genres + data1["genres"].elementAt(i)["name"]+", ";
      }
    }

  }
  return genres.substring(0,genres.length-2);
}
