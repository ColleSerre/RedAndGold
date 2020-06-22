import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

class NewsRequest {
  var status;
  var results;
  var url;
  Future<void> getFeed() async {
    var response = await http.get(
        "http://newsapi.org/v2/everything?q=Apple&from=2020-06-22&sortBy=popularity&apiKey=f5d7d2d6ea364425a88b196b2af3d53f");
    Map<String, dynamic> jsonResponse = jsonDecode(response.toString());
    print(jsonResponse["status"]);
    print(jsonResponse["totalResults"]);
  }

  NewsRequest() {
    getFeed();
  }
}

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Facts"),
      drawer: drawerMenu(context),
      body: RaisedButton(onPressed: () => NewsRequest()),
    );
  }
}
