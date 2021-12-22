import 'package:flutter/material.dart';
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(child: Container(
                      width: 104,
                      height: 159.17,
                      child: Text('awd'),
                    ),onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => movie_detail()));
                    },
                    ); 
                      
                  },
                )),
            Text("개봉예정"),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
