import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'create_page.dart';
import 'story.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color background = Color(0xfffafafb);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: background,
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.menu), color: Colors.black54,
              onPressed: () {}),
          title: Text("What's happen", style: TextStyle(color: Colors.black54),),
          centerTitle: true,
          actions: <Widget>[IconButton(icon: Icon(Icons.add), color: Colors.black54,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreatePage()));
            },)
          ],
        ),
        body: ListView(children: <Widget>[
          buildRowStory(story: Story(name: "Nolan Timble", time: 10, color: Colors.purple[300])),
          buildRowStory(story: Story(name: "Billy Ok", time: 15, color: Colors.green[300])),
          buildRowStory(story: Story(name: "Broly Horon", time: 16, color: Colors.orange[300])),
          buildRowStory(story: Story(name: "Jacky Cheng", time: 22, color: Colors.blue[300])),
        ]));
  }

  Widget buildRowStory({Story story}) {
    return Column(children: <Widget>[
      Container(constraints: BoxConstraints.expand(height: 120),
          child: ListView(padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              children: buildRowImage)),
      Padding(padding: EdgeInsets.all(16),
          child: Row(
              children: <Widget>[
                CircleAvatar(child: Icon(
                    Icons.person,
                    color: Colors.white),
                    backgroundColor: Colors.purple[200]),
                Container(margin: EdgeInsets.only(left: 8),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(story.name, textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold
                              )),
                          Text("${story.time} Minutes ago", style: TextStyle(
                            color: Colors.black54.withOpacity(0.5),
                          )),
                        ])),
                Expanded(child: Container()),
                FlatButton(child: Text("see more", style: TextStyle(color: Colors.white),),
                    color: story.color,
                    onPressed: () {})
              ])
      )
    ]);
  }

  List<Widget> get buildRowImage {
    var imagePaths = [
      "IMG_20181017_090954.jpg",
      "IMG_20181017_090956.jpg",
      "IMG_20181017_090957.jpg",
      "IMG_20181017_090959.jpg",
    ];

    return imagePaths.map(createImageContainer).toList();
  }

  Container createImageContainer(path) {
    return Container(
        margin: EdgeInsets.all(4),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset('assets/images/$path',
                width: 150, height: 150, fit: BoxFit.cover)));
  }
}