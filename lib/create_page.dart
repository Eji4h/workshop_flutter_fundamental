import 'package:flutter/material.dart';
import 'movie.dart';

class CreatePage extends StatefulWidget {

  CreatePage();

  @override
  State<StatefulWidget> createState() {
    return CreatePageState();
  }
}

class CreatePageState extends State<CreatePage> {
  List<Movie> listMovie = List();
  final Color background = Color(0xfffafafb);

  @override
  void initState() {
    listMovie = generateMovieList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: background,
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black54),
              onPressed: () => Navigator.pop(context)),
          title: Text("Create list".toUpperCase(), style: TextStyle(color: Colors.black54),),
          centerTitle: true,
          actions: <Widget>[
            Container(padding: EdgeInsets.all(16),
                child: Text("2", style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 24)))
          ],
        ),
        body: Column(children: <Widget>[
          buildSearchTextField(),
          Expanded(
              child: ListView.builder(
                  itemCount: listMovie.length,
                  itemBuilder: (context, i) {
                    return buildRowMovie(listMovie[i]);
                  }))
        ]));
  }

  buildSearchTextField() {
    return Container(
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
                color: Colors.black54.withOpacity(0.2),
                width: 1)),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(children: <Widget>[
          Icon(Icons.search, size: 24, color: Colors.black54.withOpacity(0.2)),
          Expanded(child:
          TextField(
              decoration: InputDecoration.collapsed(hintText: "Find you fav anything",
                  hintStyle: TextStyle(
                      color: Colors.black54.withOpacity(0.2))))),
          Icon(Icons.filter_list, size: 24, color: Colors.black54.withOpacity(0.2)),
        ]));
  }

  List<Movie> generateMovieList() {
    List<Movie> list = List();
    list.add(Movie(title: "Silicon Valley",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip"));
    list.add(Movie(title: "Luke Cage",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing"
            " elit, sed do eiusmod tempor incididunt ut labore et dolore"
            " magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation"
            " ullamco laboris nisi ut aliquip",
        isHot: true));
    list.add(Movie(title: "Luke Cage",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip"));
    list.add(Movie(title: "Luke Cage",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip"));
    list.add(Movie(title: "Luke Cage",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip"));
    list.add(Movie(title: "Luke Cage",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip"));
    return list;
  }

  Widget buildRowMovie(Movie movie) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(6)),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset("assets/images/IMG_20181017_090954.jpg",
                width:
                80,
                height: 80,
                fit: BoxFit.
                cover),
            Expanded(child: Container(
                margin: EdgeInsets.only(left: 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text(movie.title,
                            style: TextStyle(fontSize: 32, fontWeight
                                : FontWeight.bold,
                                color: Colors.black54
                            )),
                        Visibility(visible: movie.isHot,
                            child: Container(padding: EdgeInsets.all(6),
                                margin: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.red[300]),
                                child: Text("Hot!",
                                  style: TextStyle(color: Colors.white),)))
                      ],),
                      Text(movie.description,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style
                              : TextStyle(color: Colors.black54.withOpacity
                            (
                              0.3
                          )
                          )
                      )
                      ,
                    ]
                ))
            )
          ]
      )
      ,
    );
  }
}