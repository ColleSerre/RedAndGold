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
  try {
    var response = await http.read(
        'http://newsapi.org/v2/everything?q=communism&from=2020-05-22&sortBy=popularity&apiKey=f5d7d2d6ea364425a88b196b2af3d53f');
    Map output = await json.decode(response);
    return output;
  } catch (e) {
    Navigator.pushNamed(context, "/");
    if (e.toString() == "Request to http://newsapi.org/v2/everything?q=communism&from=2020-05-22&sortBy=popularity&apiKey=f5d7d2d6ea364425a88b196b2af3d53f failed with status 426: Upgrade Required."){
      showDialog(context: context, child: AlertDialog(title: Text("News API Error: Account Upgrade Required (error 426"),));
    }
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
                snapshot.data["articles"][0]["urlToImage"].toString());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget newsGridView(image1) {
  print(image1);
  return StaggeredGridView.count(
    padding: EdgeInsets.all(8),
    crossAxisCount: 2,
    mainAxisSpacing: 5,
    staggeredTiles: [StaggeredTile.count(2, 1)],
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Container(
                  child: FutureBuilder<Widget>(
                    future: getImage(image1),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: snapshot.data,
                        );
                      } else {
                        {
                          return Text("Loading assets...");
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red[200], width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ],
  );
}

Future<Widget> getImage(image1) async {
  final image = await Image.network(
    image1,
    fit: BoxFit.scaleDown,
  );
  return image;
}
