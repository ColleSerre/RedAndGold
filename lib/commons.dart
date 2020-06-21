import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget redirectButton(
    BuildContext context, String path, String text, Icon icon) {
  return Container(
    color: Colors.red[200],
    child: ListTile(
      title: Text(text),
      trailing: icon,
      onTap: () => Navigator.pushNamed(context, path),
    ),
  );
}

Widget appBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(title),
    backgroundColor: Colors.red[300],
  );
}

Widget drawerMenu(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 100,
          color: Colors.red[100],
          child: ListTile(
            title: Text(
              "\nThe Communist\nManifesto",
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
        ),
        redirectButton(context, '/fullText', 'Full text', Icon(Icons.book)),
      ],
    ),
  );
}
