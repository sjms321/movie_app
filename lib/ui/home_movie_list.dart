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
        child: Container(
          height: 1250,
          child: Stack(
            children: [
              Positioned(
                left: 16,
                top: 43,
                child: Container(

                  child: Text(
                    "현재 상영중",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),),
              Positioned(
                top: 89,
                child: Container(
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
                          int count_start = (snapshot.data!.elementAt(index).vote_average/2).toInt();
                          if(snapshot.data!.elementAt(index).vote_average%2>1) count_start++;
                          return GestureDetector(
                            child:Container(
                              margin: EdgeInsets.only(left: 16),
                              child: Column(
                                children: [
                                  Container(
                                    width: 104,
                                    height: 159.17,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage("https://image.tmdb.org/t/p/w500${snapshot.data!.elementAt(index).image}")
                                        ),
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 6.83),
                                    width: 104,
                                    child: Text(snapshot.data!.elementAt(index).title,overflow:TextOverflow.ellipsis ,textAlign: TextAlign.center,),
                                  ),
                                  Row(
                                    children: List<Widget>.generate(5,(index){

                                     if(count_start>0){
                                       count_start--;
                                       return Container(
                                         margin: EdgeInsets.all(2.5),
                                         child:Icon(
                                           Icons.star,size:9,color: Color(0xffF1C644),),);
                                     }
                                     else return Container(
                                       margin: EdgeInsets.all(2.5),
                                       child:Icon(
                                         Icons.star,size:9,color: Color(0xffC4C4C4),),);
                                    }),
                                  ),
                                ],
                              ),
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
                  )),),

              Positioned(
                left: 16,
                top: 325,
                child: Container(

                  child: Text(
                    "개봉예정",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),),

              Positioned(
                top: 371,
                left: 16,
                child: Container(
                width:  MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: get_upcomming(),
                  builder: (BuildContext context, AsyncSnapshot<List<UpMovie>> snapshot) {

                    return  Column(
                      children: List<Widget>.generate(3,(index){
                        int count_start = (snapshot.data!.elementAt(index).vote_average/2).toInt();
                        if(snapshot.data!.elementAt(index).vote_average%2>1) count_start++;
                        return Container(
                          height:69,
                          margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                          width:  MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 69,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage("https://image.tmdb.org/t/p/w500${snapshot.data!.elementAt(index).image}"),
                                      fit: BoxFit.cover
                                  ),
                                    borderRadius: BorderRadius.circular(8)
                                ),

                              ),
                              Container(
                                width: MediaQuery.of(context).size.width-61,
                                padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data!.elementAt(index).title,style: TextStyle(fontSize: 10),),
                                    Row(
                                      children: List<Widget>.generate(5,(index){

                                        if(count_start>0){
                                          count_start--;
                                          return Container(
                                            margin: EdgeInsets.all(2.5),
                                            child:Icon(
                                              Icons.star,size:9,color: Color(0xffF1C644),),);
                                        }
                                        else return Container(
                                          margin: EdgeInsets.all(2.5),
                                          child:Icon(
                                            Icons.star,size:9,color: Color(0xffC4C4C4),),);
                                      }),
                                    ),

                                    SizedBox(height:16,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(snapshot.data!.elementAt(index).genres.toString(),style: TextStyle(fontSize: 9),),
                                        Text(snapshot.data!.elementAt(index).release_date,style: TextStyle(fontSize: 9),),
                                      ],
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                        );
                      }),
                    );

                  },

                ),
              ),),

              Positioned(
                left: 16,
                top: 618,
                child: Container(

                  child: Text(
                    "인기",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),),

              Positioned(
                top: 664,
                left: 16,
                child: Container(
                  width:  MediaQuery.of(context).size.width,
                  child: FutureBuilder(
                    future: get_popular(),
                    builder: (BuildContext context, AsyncSnapshot<List<PopularMovie>> snapshot) {
                      return  Column(
                        children: List<Widget>.generate(3,(index){
                          return Container(
                            height:69,
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            width:  MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 69,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage("https://image.tmdb.org/t/p/w500${snapshot.data!.elementAt(index).image}"),
                                          fit: BoxFit.cover
                                      ),
                                      borderRadius: BorderRadius.circular(8)
                                  ),

                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width-61,
                                  padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data!.elementAt(index).title,style: TextStyle(fontSize: 10),),
                                      Text(snapshot.data!.elementAt(index).vote_average.toString(),style: TextStyle(fontSize: 10),),

                                      SizedBox(height:16,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(snapshot.data!.elementAt(index).genres.toString(),style: TextStyle(fontSize: 9),),
                                          Text(snapshot.data!.elementAt(index).release_date,style: TextStyle(fontSize: 9),),
                                        ],
                                      )
                                    ],
                                  ),
                                )

                              ],
                            ),
                          );
                        }),
                      );

                    },

                  ),
                ),),

              Positioned(
                left: 16,
                top: 911,
                child: Container(

                  child: Text(
                    "높은평점",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),),

              Positioned(
                top: 957,
                left: 16,
                child: Container(
                  width:  MediaQuery.of(context).size.width,
                  child: FutureBuilder(
                    future: get_top_rated(),
                    builder: (BuildContext context, AsyncSnapshot<List<TopMovie>> snapshot) {
                      return  Column(
                        children: List<Widget>.generate(3,(index){
                          return Container(
                            height:69,
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            width:  MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 69,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage("https://image.tmdb.org/t/p/w500${snapshot.data!.elementAt(index).image}"),
                                          fit: BoxFit.cover
                                      ),
                                      borderRadius: BorderRadius.circular(8)
                                  ),

                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width-61,
                                  padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data!.elementAt(index).title,style: TextStyle(fontSize: 10),),
                                      Text(snapshot.data!.elementAt(index).vote_average.toString(),style: TextStyle(fontSize: 10),),

                                      SizedBox(height:16,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(snapshot.data!.elementAt(index).genres.toString(),style: TextStyle(fontSize: 9),),
                                          Text(snapshot.data!.elementAt(index).release_date,style: TextStyle(fontSize: 9),),
                                        ],
                                      )
                                    ],
                                  ),
                                )

                              ],
                            ),
                          );
                        }),
                      );

                    },

                  ),
                ),)


              //
              //
              // Text("인기"),
              //
              // Container(
              //   height: 600,
              //   width:  MediaQuery.of(context).size.width,
              //   child: FutureBuilder(
              //     future: get_popular(),
              //     builder: (BuildContext context, AsyncSnapshot<List<PopularMovie>> snapshot) {
              //       return Column(
              //         children: List<Widget>.generate(3,(index){
              //           return Container(
              //             height: 167.17,
              //             width:  MediaQuery.of(context).size.width,
              //             padding: EdgeInsets.all(8),
              //             child: Row(
              //               children: [
              //                 Container(
              //                   width: MediaQuery.of(context).size.width*0.25,
              //                   height: 159.17,
              //                   child:Image.network("https://image.tmdb.org/t/p/w500${snapshot.data!.elementAt(index).image}",fit: BoxFit.fill,) ,
              //                 ),
              //                 Container(
              //                   width: MediaQuery.of(context).size.width*0.7,
              //                   height: 159.17,
              //                   padding: EdgeInsets.all(10),
              //                   child:  Column(
              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //
              //                       Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         children: [
              //                           Text(snapshot.data!.elementAt(index).title),
              //                           Text(snapshot.data!.elementAt(index).vote_average.toString()),
              //                         ],
              //                       ),
              //
              //
              //                       Row(
              //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                         children: [
              //                           Text(snapshot.data!.elementAt(index).genres.toString()),
              //                           Text(snapshot.data!.elementAt(index).release_date),
              //                         ],
              //                       )
              //                     ],
              //                   ),
              //                 )
              //
              //               ],
              //             ),
              //           );
              //         }),
              //       );
              //     },
              //
              //   ),
              // ),
              //
              // Text("높은 평점"),
              //
              // Container(
              //   height: 600,
              //   width:  MediaQuery.of(context).size.width,
              //   child: FutureBuilder(
              //     future: get_top_rated(),
              //     builder: (BuildContext context, AsyncSnapshot<List<TopMovie>> snapshot) {
              //       return Column(
              //         children: List<Widget>.generate(3,(index){
              //           return Container(
              //             height: 167.17,
              //             width:  MediaQuery.of(context).size.width,
              //             padding: EdgeInsets.all(8),
              //             child: Row(
              //               children: [
              //                 Container(
              //                   width: MediaQuery.of(context).size.width*0.25,
              //                   height: 159.17,
              //                   child:Image.network("https://image.tmdb.org/t/p/w500${snapshot.data!.elementAt(index).image}",fit: BoxFit.fill,) ,
              //                 ),
              //                 Container(
              //                   width: MediaQuery.of(context).size.width*0.7,
              //                   height: 159.17,
              //                   padding: EdgeInsets.all(10),
              //                   child:  Column(
              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //
              //                       Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         children: [
              //                           Text(snapshot.data!.elementAt(index).title),
              //                           Text(snapshot.data!.elementAt(index).vote_average.toString()),
              //                         ],
              //                       ),
              //
              //
              //                       Row(
              //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                         children: [
              //                           Text(snapshot.data!.elementAt(index).genres.toString()),
              //                           Text(snapshot.data!.elementAt(index).release_date),
              //                         ],
              //                       )
              //                     ],
              //                   ),
              //                 )
              //
              //               ],
              //             ),
              //           );
              //         }),
              //       );
              //     },
              //
              //   ),
              // ),
            ],
          ),
        )

      ),
    );
  }
}
