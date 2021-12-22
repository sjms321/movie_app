import 'package:flutter/material.dart';
import 'package:movie_app/model/get_detail_movie.dart';
import 'package:movie_app/model/get_main_actors.dart';
import 'package:movie_app/model/get_review.dart';

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
      body:SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child:

            Container(
              height: 971,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: get_detail(widget.movie_id),
                builder: (BuildContext context, AsyncSnapshot<Detail_Movie> snapshot) {
                  if (snapshot.hasData == false) {
                    return CircularProgressIndicator();
                  }
                  return Container(
                      child: Stack(
                        children:[
                          Image.network("https://image.tmdb.org/t/p/w500${snapshot.data!.backdrop}",fit: BoxFit.cover,),

                          Positioned(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft:Radius.circular(16) ,topRight:Radius.circular(16) ),
                                  color: Colors.white
                              ),
                            ),
                            top: 169,height: 128,width:MediaQuery.of(context).size.width,
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
                                        image: NetworkImage("https://image.tmdb.org/t/p/w500${snapshot.data!.poster}"),
                                        fit: BoxFit.cover)
                                ),
                              )),

                          Positioned(
                              left: 136,
                              top: 185,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data!.title),
                                    snapshot.data!.adult
                                        ?Text("빨간버튼")
                                        :Container(),
                                    Row(
                                      children:
                                      List<Widget>.generate(snapshot.data!.genres.length, (index){
                                        return Text(snapshot.data!.genres.elementAt(index)["name"]+" ");
                                      }),
                                    ),
                                    Text(snapshot.data!.release_date),
                                    Text(snapshot.data!.vote_average.toString()),
                                  ],
                                ),
                              )
                          ),
                          Positioned(
                              top: 301, 
                              left: 16, 
                              child: Text("개요",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                          ),
                          Positioned(
                              top: 341,
                              left: 16,
                              right: 16,
                              bottom: 503,
                              child: Text(snapshot.data!.overview,style: TextStyle(fontSize: 14,letterSpacing: -0.015,color: Color(0xff828282)),)
                          ),

                          Positioned(
                              top: 492,
                              left: 16,
                              child: Text("주요출연진",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                          ),

                          Positioned(
                              top: 532,
                              child:
                                  FutureBuilder(
                                    future: get_actors(widget.movie_id),
                                    builder: (BuildContext context, AsyncSnapshot<List<Main_Actor>> snapshot) {
                                      if (snapshot.hasData == false) {
                                        return CircularProgressIndicator();
                                      }
                                      return Container(
                                        height: 54,
                                        width: MediaQuery.of(context).size.width,
                                        child:ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 10,
                                            itemBuilder: (BuildContext context, int index) {
                                              return  Container(
                                                padding: EdgeInsets.only(left: 16),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration:  BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                              image: NetworkImage("https://image.tmdb.org/t/p/w500${snapshot.data!.elementAt(index).image}"),
                                                              fit: BoxFit.cover)
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 12,
                                                      child: FittedBox(
                                                        fit: BoxFit.contain,
                                                        child:Text(snapshot.data!.elementAt(index).name,),
                                                      )

                                                    )
                                                  ],
                                                ),
                                              );
                                            }) ,
                                      );
                                  },

                                  )


                                // Row(
                                //   children:
                                //   List<Widget>.generate(10,(index){
                                //     return
                                //    ;
                                //   }
                                //   )
                                // )



                          ),

                          Positioned(
                              top: 610,
                              left: 16,
                              child: Text("리뷰",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                          ),

                          Positioned(
                              top: 650,
                              right: 16,
                              left: 16,
                              child: FutureBuilder(

                                future: get_reviews(widget.movie_id),
                                builder: (BuildContext context, AsyncSnapshot<List<Review>> snapshot) {
                                  if (snapshot.hasData == false) {
                                    return CircularProgressIndicator();
                                  }
                                  if(snapshot.data!.isEmpty){
                                    return Center(child: Text("no rivew"),);
                                  }
                                  return Column(
                                    children: List<Widget>.generate(
                                      3,(index){
                                        return Container(
                                            padding: EdgeInsets.all(8),
                                            margin: EdgeInsets.only(bottom:16 ),
                                            height: 71,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black26
                                                ),
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(snapshot.data!.elementAt(index).content,overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(color: Color(0xff616161)),textAlign: TextAlign.start,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text(snapshot.data!.elementAt(index).author,style: TextStyle(color: Color(0xffA2A2A2)),)
                                                  ],
                                                )
                                              ],
                                            )

                                        );
                                    }
                                    ),
                                  );


                              },
                              )
                          ),
                  ],
                      )
                  );
                },

              ),
            ),


      )

    );
  }

}