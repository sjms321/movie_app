import 'package:flutter/material.dart';
import 'package:movie_app/model/get_genre.dart';
import 'package:movie_app/model/get_special_three_movies.dart';
import 'package:movie_app/ui/movie_detail.dart';

class specially_three_movie extends StatefulWidget {
  final double top;
  final double left;
  final String special;


  specially_three_movie({required this.top,required this.left,required this.special});
  @override
  _specially_three_movie createState() => _specially_three_movie();
}

class _specially_three_movie extends State<specially_three_movie> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: widget.left,
      child: Container(
        width:  MediaQuery.of(context).size.width,

        child: FutureBuilder(
          future: get_special_three_movie(widget.special),
          builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.hasData == false) {
              return Container();
            }
            return Column(
              children: List<Widget>.generate(3,(index){
                int count_start = (snapshot.data!.elementAt(index).vote_average/2).toInt();
                if(snapshot.data!.elementAt(index).vote_average%2>1) count_start++;
                return GestureDetector(
                    child: Container(
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
                                Text(snapshot.data!.elementAt(index).title,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,letterSpacing: -0.015),),
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
                                    FutureBuilder(
                                      future: get_genre(snapshot.data!.elementAt(index).genres.cast<int>()),
                                      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                        if (snapshot.hasData == false) {
                                          return Container();
                                        }
                                        return Text(snapshot.data!.toString(),style: TextStyle(fontSize: 9,color: Color(0xff9A9A9A)),);
                                      },),
                                    Text(snapshot.data!.elementAt(index).release_date,style: TextStyle(fontSize: 9,color: Color(0xff9A9A9A)),),
                                  ],
                                )
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => movie_detail(movie_id: snapshot.data!.elementAt(index).id,)));
                    }
                );

              }),
            );




          },

        ),


      ),);
  }}
