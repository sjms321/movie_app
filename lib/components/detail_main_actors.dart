import 'package:flutter/material.dart';
import 'package:movie_app/model/get_main_actors.dart';

class detail_main_actor extends StatefulWidget {
  final int movie_id;
  detail_main_actor({required this.movie_id});
  @override
  _detail_main_actor createState() => _detail_main_actor();
}

class _detail_main_actor extends State<detail_main_actor> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: get_actors(widget.movie_id),
      builder: (BuildContext context, AsyncSnapshot<List<Main_Actor>> snapshot) {
        if (snapshot.hasData == false) {
          return Container();
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

    );
  }

}