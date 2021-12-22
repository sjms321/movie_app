import 'package:flutter/material.dart';
import 'package:movie_app/components/adult_button.dart';
import 'package:movie_app/components/detail_main_actors.dart';
import 'package:movie_app/components/detail_overview.dart';
import 'package:movie_app/components/detail_review.dart';
import 'package:movie_app/components/detail_subtitle_text.dart';
import 'package:movie_app/model/get_detail_movie.dart';
import 'package:movie_app/model/get_main_actors.dart';

class movie_detail extends StatefulWidget {
  final int movie_id;

  movie_detail({required this.movie_id});
  @override
  _movie_detail createState() => _movie_detail();
}

class _movie_detail extends State<movie_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        height: 971,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: get_detail(widget.movie_id),
          builder:
              (BuildContext context, AsyncSnapshot<Detail_Movie> snapshot) {
            if (snapshot.hasData == false) {
              return Container();
            }
            int countStart = snapshot.data!.vote_average ~/ 2;
            if (snapshot.data!.vote_average % 2 > 1) countStart++;
            return Container(
                child: Stack(
              children: [
                Image.network(
                  "https://image.tmdb.org/t/p/w500${snapshot.data!.backdrop}",
                  fit: BoxFit.cover,
                ),
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        color: Colors.white),
                  ),
                  top: 169,
                  height: 128,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                    left: 16,
                    top: 118,
                    child: Container(
                      height: 159,
                      width: 104,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/w500${snapshot.data!.poster}"),
                              fit: BoxFit.cover)),
                    )),
                Positioned(
                    left: 136,
                    top: 185,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.title,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.015),
                          ),
                          snapshot.data!.adult ? adult_buttton() : Container(),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: List<Widget>.generate(
                                snapshot.data!.genres.length, (index) {
                              return Text(
                                snapshot.data!.genres.elementAt(index)["name"] +
                                    " ",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xffB9B9B9),
                                    letterSpacing: -0.015),
                              );
                            }),
                          ),
                          Text(snapshot.data!.release_date + " 발매",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xffB9B9B9),
                                  letterSpacing: -0.015)),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: List<Widget>.generate(
                              6,
                              (index) {
                                if (index == 5)
                                  return Text(
                                    snapshot.data!.vote_average.toString(),
                                    style: TextStyle(
                                        color: Color(0xffF1C644),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  );
                                if (countStart > 0) {
                                  countStart--;
                                  return Container(
                                    margin: EdgeInsets.all(2.5),
                                    child: Icon(
                                      Icons.star,
                                      size: 13,
                                      color: Color(0xffF1C644),
                                    ),
                                  );
                                } else
                                  return Container(
                                    margin: EdgeInsets.all(2.5),
                                    child: Icon(
                                      Icons.star,
                                      size: 13,
                                      color: Color(0xffC4C4C4),
                                    ),
                                  );
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
                detail_subtitle_text(16, 301, "개요"),
                detail_overview(snapshot.data!.overview),
                detail_subtitle_text(16, 492, "주요출연진"),
                detail_main_actor(movie_id: widget.movie_id),
                detail_subtitle_text(16, 610, "리뷰"),
                detail_review(movie_id: widget.movie_id),
              ],
            ));
          },
        ),
      ),
    ));
  }
}
