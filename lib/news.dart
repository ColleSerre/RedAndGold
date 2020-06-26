import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'commons.dart';

Future<Map> getBody(BuildContext context) async {
  final now = DateTime.now();
  final date = now.year.toString() +
      "-" +
      now.month.toString() +
      "-" +
      now.day.toString();
  try {
    var response = await http.read(
        'http://newsapi.org/v2/everything?q=marxism&from=' +
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
            return StaggeredGridView.count(
              staggeredTiles: [
                StaggeredTile.fit(1),
                StaggeredTile.fit(1),
                StaggeredTile.fit(1),
                StaggeredTile.fit(1),
                StaggeredTile.fit(1),
                StaggeredTile.fit(1),
                StaggeredTile.fit(1),
                StaggeredTile.fit(1),
                StaggeredTile.fit(1),
                StaggeredTile.fit(1),
              ],
              crossAxisCount: 1,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: feedTile(
                    snapshot.data["articles"][0]["urlToImage"].toString(),
                    snapshot.data["articles"][0]["title"].toString(),
                    snapshot.data["articles"][0]["url"].toString(),
                    context,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: feedTile(
                    snapshot.data["articles"][1]["urlToImage"].toString(),
                    snapshot.data["articles"][1]["title"].toString(),
                    snapshot.data["articles"][1]["url"].toString(),
                    context,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: feedTile(
                    snapshot.data["articles"][2]["urlToImage"].toString(),
                    snapshot.data["articles"][2]["title"].toString(),
                    snapshot.data["articles"][2]["url"].toString(),
                    context,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: feedTile(
                    snapshot.data["articles"][3]["urlToImage"].toString(),
                    snapshot.data["articles"][3]["title"].toString(),
                    snapshot.data["articles"][3]["url"].toString(),
                    context,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: feedTile(
                    snapshot.data["articles"][4]["urlToImage"].toString(),
                    snapshot.data["articles"][4]["title"].toString(),
                    snapshot.data["articles"][4]["url"].toString(),
                    context,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: feedTile(
                    snapshot.data["articles"][5]["urlToImage"].toString(),
                    snapshot.data["articles"][5]["title"].toString(),
                    snapshot.data["articles"][5]["url"].toString(),
                    context,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: feedTile(
                    snapshot.data["articles"][6]["urlToImage"].toString(),
                    snapshot.data["articles"][6]["title"].toString(),
                    snapshot.data["articles"][6]["url"].toString(),
                    context,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: feedTile(
                    snapshot.data["articles"][7]["urlToImage"].toString(),
                    snapshot.data["articles"][7]["title"].toString(),
                    snapshot.data["articles"][7]["url"].toString(),
                    context,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: feedTile(
                    snapshot.data["articles"][8]["urlToImage"].toString(),
                    snapshot.data["articles"][8]["title"].toString(),
                    snapshot.data["articles"][8]["url"].toString(),
                    context,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: feedTile(
                    snapshot.data["articles"][9]["urlToImage"].toString(),
                    snapshot.data["articles"][9]["title"].toString(),
                    snapshot.data["articles"][9]["url"].toString(),
                    context,
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget feedTile(image, title, url, context) {
  final size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () async {
      if (await canLaunch(url)) {
        launch(url);
        return "Successfully launched URL";
      } else {
        return "Couldn't launch URL";
      }
    },
    child: Container(
      padding: EdgeInsets.all(9),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.red[200], width: 3)),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              image,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            width: size.width - 120,
          )
        ],
      ),
    ),
  );
}
