import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'commons.dart';
import 'mainMenu.dart';
import 'fullText.dart';
import 'history.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/fullText': (BuildContext context) => FullText(),
        '/news': (BuildContext context) => News(),
        '/history': (BuildContext context) => History(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("The Communist Manifesto"),
      drawer: drawerMenu(context),
      body: menuGrid(context),
    );
  }
}

Future<Map> getBody(BuildContext context) async {
  final now = DateTime.now();
  final date = now.year.toString() +
      "-" +
      now.month.toString() +
      "-" +
      now.day.toString();
  try {
    var response = await http.read(
        'http://newsapi.org/v2/everything?q=communism&from=' +
            date +
            '&sortBy=popularity&apiKey=f5d7d2d6ea364425a88b196b2af3d53f');
    Map output = await json.decode(response);
    return output;
  } catch (e) {
    Navigator.pushNamed(context, "/");
  }
}

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("News"),
      drawer: drawerMenu(context),
      body: FutureBuilder(
        future: getBody(context),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return newsGridView(
                snapshot.data["articles"][0]["urlToImage"].toString(),
                snapshot.data["articles"][0]["url"].toString(),
                snapshot.data["articles"][0]["title"].toString(),
                snapshot.data["articles"][0]["description"].toString());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget newsGridView(image1, articleURL, title, description) {
  print(image1);
  print(description);
  return StaggeredGridView.count(
    padding: EdgeInsets.all(8),
    crossAxisCount: 2,
    mainAxisSpacing: 5,
    staggeredTiles: [StaggeredTile.count(2, 1)],
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red[100], width: 3)),
          child: FutureBuilder<Widget>(
            future: getImage(image1, articleURL, title, description),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data;
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    ],
  );
}

Future<Widget> getImage(image1, articleURL, title, description) async {
  final image = Image.network(
    image1,
    fit: BoxFit.cover,
  );

  return GestureDetector(
    onTap: () async {
      if (await canLaunch(articleURL)) {
        launch(articleURL);
        return "";
      } else {
        return "Cannot launch URL";
      }
    },
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20), child: image),
            height: 95,
            width: 95,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 90, width: 250, child: Text(title + "\n" + description)),
        ),
      ],
    ),
  );
}
