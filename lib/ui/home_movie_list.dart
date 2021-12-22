import 'package:flutter/material.dart';
import 'package:movie_app/model/get_nowplaying_movies.dart';
import 'package:movie_app/model/get_popular_movies.dart';
import 'package:movie_app/model/get_top_rated_movie.dart';
import 'package:movie_app/model/get_upcoming_movies.dart';
import 'package:movie_app/ui/movie_detail.dart';

class home_movie_list extends StatefulWidget {
  @override
  _home_movie_list createState() => _home_movie_list();
}

class _home_movie_list extends State<home_movie_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 50,
              child: Text(
                "현재 상영중",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.black,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: FutureBuilder(
                  future: get_nowplaying(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Movie>> snapshot) {


                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child:
                          Column(
                            children: [
                              Container(
                                width: 104,
                                height: 159.17,
                                child: Image.network("https://image.tmdb.org/t/p/w500${snapshot.data!.elementAt(index).image}"),
                              ),
                              Text(snapshot.data!.elementAt(index).title),
                              Text(snapshot.data!.elementAt(index).vote_average.toString())
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => movie_detail()));
                          },
                        );
                      },
                    );
                  },
                )),
            Text("개봉예정"),




            Container(
              height: 600,
              width:  MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: get_upcomming(),
                builder: (BuildContext context, AsyncSnapshot<List<UpMovie>> snapshot) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return  Container(
                      height: 167.17,
                      width:  MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.25,
                            height: 159.17,
                            child:Image.network("https://image.tmdb.org/t/p/w500${snapshot.data!.elementAt(index).image}",fit: BoxFit.fill,) ,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            height: 159.17,
                            padding: EdgeInsets.all(10),
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data!.elementAt(index).title),
                                    Text(snapshot.data!.elementAt(index).vote_average.toString()),
                                  ],
                                ),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(snapshot.data!.elementAt(index).genres.toString()),
                                    Text(snapshot.data!.elementAt(index).release_date),
                                  ],
                                )
                              ],
                            ),
                          )

                        ],
                      ),
                    );
                  },
                );
              },

              ),
            ),



            Text("인기"),

            Container(
              height: 600,
              width:  MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: get_popular(),
                builder: (BuildContext context, AsyncSnapshot<List<PopularMovie>> snapshot) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount:snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return  Container(
                        height: 167.17,
                        width:  MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.25,
                              height: 159.17,
                              child:Image.network("https://image.tmdb.org/t/p/w500${snapshot.data!.elementAt(index).image}",fit: BoxFit.fill,) ,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              height: 159.17,
                              padding: EdgeInsets.all(10),
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data!.elementAt(index).title),
                                      Text(snapshot.data!.elementAt(index).vote_average.toString()),
                                    ],
                                  ),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(snapshot.data!.elementAt(index).genres.toString()),
                                      Text(snapshot.data!.elementAt(index).release_date),
                                    ],
                                  )
                                ],
                              ),
                            )

                          ],
                        ),
                      );
                    },
                  );
                },

              ),
            ),

        Text("높은 평점"),

       Container(
          height: 600,
          width:  MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: get_top_rated(),
            builder: (BuildContext context, AsyncSnapshot<List<TopMovie>> snapshot) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount:snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return  Container(
                    height: 167.17,
                    width:  MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.25,
                          height: 159.17,
                          child:Image.network("https://image.tmdb.org/t/p/w500${snapshot.data!.elementAt(index).image}",fit: BoxFit.fill,) ,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          height: 159.17,
                          padding: EdgeInsets.all(10),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data!.elementAt(index).title),
                                  Text(snapshot.data!.elementAt(index).vote_average.toString()),
                                ],
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.elementAt(index).genres.toString()),
                                  Text(snapshot.data!.elementAt(index).release_date),
                                ],
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  );
                },
              );
            },

          ),
        ),
          ],
        ),
      ),
    );
  }
}
