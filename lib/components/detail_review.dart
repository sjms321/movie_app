import 'package:flutter/material.dart';
import 'package:movie_app/model/get_review.dart';

class detail_review extends StatefulWidget {
  final int movie_id;
  detail_review({required this.movie_id});
  @override
  _detail_review createState() => _detail_review();
}

class _detail_review extends State<detail_review> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 650,
        right: 16,
        left: 16,
        child: FutureBuilder(
          future: get_reviews(widget.movie_id),
          builder:
              (BuildContext context, AsyncSnapshot<List<Review>> snapshot) {
            if (snapshot.hasData == false) {
              return Container();
            }
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text("no rivew"),
              );
            }
            if (snapshot.data!.length > 3) snapshot.data!.length = 3;
            return Column(
              children: List<Widget>.generate(snapshot.data!.length, (index) {
                return Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(bottom: 16),
                    height: 71,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black26),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.data!.elementAt(index).content,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style:
                              TextStyle(color: Color(0xff616161), fontSize: 12),
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              snapshot.data!.elementAt(index).author,
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xffA2A2A2)),
                            )
                          ],
                        )
                      ],
                    ));
              }),
            );
          },
        ));
  }
}
