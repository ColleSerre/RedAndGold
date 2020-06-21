import 'package:flutter/material.dart';
import 'commons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Manifesto.dart';

class FullText extends StatelessWidget {
  Widget header(String arg) {
    return Container(
      padding: EdgeInsets.all(9),
      child: Text(
        arg,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget paragraph(String arg) {
    return Container(
      padding: EdgeInsets.all(9),
      child: Text(arg, style: TextStyle(fontSize: 20)),
    );
  }

  Widget mainTitle() {
    return Text(
      header1,
      textAlign: TextAlign.center,
      style: GoogleFonts.cinzel(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }

  Widget coolPunchline() {
    return Text(ultraCoolPunchline,
        textAlign: TextAlign.center, style: TextStyle(fontSize: 30));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar("Full Text"),
      drawer: drawerMenu(context),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: size.height / 1.25,
                width: size.width / 1.30,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange[200], width: 4),
                    borderRadius: BorderRadius.circular(25)),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      mainTitle(),
                      paragraph(paragraph1),
                      header(header2),
                      paragraph(paragraph2),
                      header(header3),
                      paragraph(paragraph3),
                      header(header4),
                      paragraph(paragraph4),
                      header(header5),
                      paragraph(paragraph5),
                      coolPunchline()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
