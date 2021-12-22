import 'package:flutter/material.dart';
import 'package:movie_app/model/get_nowplaying_movies.dart';
import 'package:movie_app/ui/movie_detail.dart';


class now_playing extends StatefulWidget {
  @override
  _now_playing createState() => _now_playing();
}

class _now_playing extends State<now_playing> {
  @override
  Widget build(BuildContext context) {

    return Positioned(
      top: 89,
      child:
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          child: FutureBuilder(
            future: get_nowplaying(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Movie>> snapshot) {
              if (snapshot.hasData == false) {
                return Container();
              }
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
                              builder: (context) => movie_detail(movie_id: snapshot.data!.elementAt(index).id,)));
                    },
                  );
                },
              );
            },
          )),);
  }

}