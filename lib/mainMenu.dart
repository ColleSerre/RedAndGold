import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

Widget menuGrid(BuildContext context) {
  return StaggeredGridView.count(
    padding: EdgeInsets.all(8),
    crossAxisCount: 2,
    mainAxisSpacing: 5,
    staggeredTiles: [
      StaggeredTile.count(1, 2),
      StaggeredTile.count(1, 1),
      StaggeredTile.count(1, 1),
      StaggeredTile.count(2, 1),
    ],
    children: <Widget>[
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, "/news"),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: 200,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text(
                    "News",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(""),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red[200], width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, "/fullText"),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: 200,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text(
                    "Full Text",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Read the Communist Manifesto.\nThe small book which changed the whole wide world.",
                      style: TextStyle(fontSize: 16),
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
      ),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, "/history"),
        child: Padding(
          // TODO: Implement History feature
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(
                  "History of the movement",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red[200], width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      Padding(
        // Implement contribute feature
        padding: const EdgeInsets.only(
          top: 2,
          left: 8,
          right: 8,
          bottom: 8,
        ),
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red[200], width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ],
  );
}
