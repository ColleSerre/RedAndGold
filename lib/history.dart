import 'commons.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar("History"),
      drawer: drawerMenu(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                width: size.width,
                height: 55,
                child: Text(
                  "Part 1: The Soviet Union",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                width: size.width,
                height: 150,
                padding: const EdgeInsets.all(8),
                color: Colors.red[200],
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "February 21st 1848\n\n",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: "Karl Marx and Friedrich Engels release ",
                            style: TextStyle(fontSize: 17)),
                        TextSpan(
                          text: "The Communist Manifesto",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_downward,
                size: 70,
              ),
              Container(
                width: size.width,
                height: 150,
                padding: const EdgeInsets.all(8),
                color: Colors.red[200],
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 17),
                      children: [
                        TextSpan(
                          text: "November 7th 1917\n\n",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                "Vladimir Lenin and the Bolsheviks seize power during Russia's "),
                        TextSpan(
                            text: "October Revolution",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Part 2: Communism takes hold in China and beyond",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                width: size.width,
                height: 150,
                padding: const EdgeInsets.all(8),
                color: Colors.red[200],
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 17),
                      children: [
                        TextSpan(
                          text: "July 1st 1921\n\n",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: "The Communist Party of China is formed"),
                      ],
                    ),
                  ),
                ),
              ),
              Icon(Icons.arrow_downward, size: 70),
              Container(
                width: size.width,
                height: 250,
                padding: const EdgeInsets.all(8),
                color: Colors.red[200],
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 17),
                      children: [
                        TextSpan(
                          text: "January 21st 1924\n\n",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                "Lenin dies at age 54 and his general secretary, "),
                        TextSpan(
                            text: "Joseph Stalin",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        TextSpan(
                            text:
                                ", takes over official rule of the Soviet Union until his death in 1953. He famously indestrialized the country through a state-controlled economy, but it led to famine. Under his regime, detractors were deported or imprisoned in labor camps, and, as part of the Great Purge, 1 million people were executed under Stalin’s orders.")
                      ],
                    ),
                  ),
                ),
              ),
              Icon(Icons.arrow_downward, size: 70),
              Container(
                width: size.width,
                height: 250,
                padding: const EdgeInsets.all(8),
                color: Colors.red[200],
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 17),
                      children: [
                        TextSpan(
                          text: "1940 to 1979\n\n",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: "Communism is establyshed by "),
                        TextSpan(
                            text: "force ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        TextSpan(
                            text:
                                "or otherwise in Estonia, Latvia, Lithuania, Yugoslavia, Poland, North Korea, Albania, Bulgaria, Romania, Czechoslovakia, East Germany, Hungary, China, Tibet, North Vietnam, Guinea, Cuba, Yemen, Kenya, Sudan, Congo, Burma, Angola, Benin, Cape Verde, Laos, Kampuchea, Madagascar, Mozambique, South Vietnam, Somalia, Seychelles, Afghanistan, Grenada, Nicaragua and others."),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Part 3: The Cold War Begins",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                width: size.width,
                height: 150,
                padding: const EdgeInsets.all(8),
                color: Colors.red[200],
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 17),
                      children: [
                        TextSpan(
                          text: "May 9th 1945\n\n",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: "USSR declares war on Nazi Germany"),
                      ],
                    ),
                  ),
                ),
              ),
              Icon(Icons.arrow_downward, size: 70),
              Container(
                width: size.width,
                height: 150,
                padding: const EdgeInsets.all(8),
                color: Colors.red[200],
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 17),
                      children: [
                        TextSpan(
                          text: "May 12th 1947\n\n",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                "Harry S. Truman introduces the Truman Doctrine which called for financial and military aid to Greece and Turkey to prevent them to fall into the Soviet Union"),
                      ],
                    ),
                  ),
                ),
              ),
              Icon(Icons.arrow_downward, size: 70),
              Container(
                width: size.width,
                height: 150,
                padding: const EdgeInsets.all(8),
                color: Colors.red[200],
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 17),
                      children: [
                        TextSpan(
                          text: "March 5 1946\n\n",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                "Great Britain Prime Minister Winston Churchill makes his famous "),
                        TextSpan(
                            text: "Iron Curtain ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "speech to alert the Americans to the divisions between the Soviet Union and the Western allies."),
                      ],
                    ),
                  ),
                ),
              ),
              Icon(Icons.arrow_downward, size: 70),
              Container(
                width: size.width,
                height: 150,
                padding: const EdgeInsets.all(8),
                color: Colors.red[200],
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 17),
                      children: [
                        TextSpan(
                          text: "October 1st 1949\n\n",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                "China's Communist Party leader Mao Zedong creates the "),
                        TextSpan(
                            text: "People's Republic of China ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "after a civil war. This will lead to the United States ending diplomatic tides with China for several decades."),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width,
                height: 150,
                padding: const EdgeInsets.all(8),
                color: Colors.red[200],
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 17),
                      children: [
                        TextSpan(
                          text: "July 5th 1950\n\n",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: "Beginning of the Korean War"),
                        TextSpan(
                            text: "STOPPING HERE LOGGING OUT FOR THE DAY",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "STOPPING HERE LOGGING OUT FOR THE DAY"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
