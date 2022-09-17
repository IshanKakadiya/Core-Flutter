import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kbc_app/Global.dart';
import 'package:kbc_app/gameover_page.dart';
import 'package:kbc_app/lose_page.dart';
import 'package:kbc_app/winner_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Home(),
      'winner_page': (context) => winner_page(),
      'gameover_page': (context) => gameover_page(),
      'lose_page': (context) => lose_page(),
    },
  ));
}

class Home extends StatefulWidget {
  //

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Random random = Random();
  //

  //
  List color = [
    Colors.pink,
    Colors.blueAccent,
    Colors.red,
    Colors.yellow,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.redAccent,
    Colors.purple,
    Colors.blue,
    Colors.orange,
    Colors.amber,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IndexedStack(
            index: Global.initialQustion,
            children: Global.questions.map((e) {
              return Column(
                children: [
                  Container(
                    height: 350,
                    color: color[Global.initialQustion],
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      e['Qustion'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 90),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 165,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (Global.initialQustion == e['id']) {
                                    if (e['ans'] == e['options1']) {
                                      Navigator.of(context).pushNamed(
                                          'winner_page',
                                          arguments: e['winning']);
                                    } else {
                                      Navigator.of(context).pushNamed(
                                        'lose_page',
                                      );
                                    }
                                  }
                                  if (Global.initialQustion <
                                      Global.questions.length - 1) {
                                    Global.initialQustion++;
                                  }
                                });
                              },
                              child: Text(
                                e['options1'],
                                textAlign: TextAlign.center,
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff1e1f23),
                                  onPrimary: const Color(0xffa8a8a9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 165,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (Global.initialQustion == e['id']) {
                                    if (e['ans'] == e['options2']) {
                                      Navigator.of(context).pushNamed(
                                          'winner_page',
                                          arguments: e['winning']);
                                    } else {
                                      Navigator.of(context).pushNamed(
                                        'lose_page',
                                      );
                                    }
                                  }
                                  if (Global.initialQustion <
                                      Global.questions.length - 1) {
                                    Global.initialQustion++;
                                  }

                                  // print(Global.initialQustion);
                                });
                              },
                              child: Text(
                                e['options2'],
                                textAlign: TextAlign.center,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff1e1f23),
                                onPrimary: Color(0xffa8a8a9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 165,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (Global.initialQustion == e['id']) {
                                    if (e['ans'] == e['options3']) {
                                      Navigator.of(context).pushNamed(
                                          'winner_page',
                                          arguments: e['winning']);
                                    } else {
                                      Navigator.of(context).pushNamed(
                                        'lose_page',
                                      );
                                    }
                                  }
                                  if (Global.initialQustion <
                                      Global.questions.length - 1) {
                                    Global.initialQustion++;
                                  }
                                });
                              },
                              child: Text(
                                e['options3'],
                                textAlign: TextAlign.center,
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff1e1f23),
                                  onPrimary: const Color(0xffa8a8a9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 165,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (Global.initialQustion == e['id']) {
                                    if (e['ans'] == e['options4']) {
                                      Navigator.of(context).pushNamed(
                                          'winner_page',
                                          arguments: e['winning']);
                                    } else {
                                      Navigator.of(context).pushNamed(
                                        'lose_page',
                                      );
                                    }
                                  }
                                  if (Global.initialQustion <
                                      Global.questions.length - 1) {
                                    Global.initialQustion++;
                                  }
                                });
                              },
                              child: Text(
                                e['options4'],
                                textAlign: TextAlign.center,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff1e1f23),
                                onPrimary: Color(0xffa8a8a9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
