// ignore_for_file: camel_case_types, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'globle.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => home(),
      },
    ),
  );
}

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  DateTime todaytime = DateTime.now();

  int second = 0;
  int minite = 0;
  int hours = 0;

  @override
  void initState() {
    super.initState();
    second = todaytime.second;
    minite = todaytime.minute;
    hours = todaytime.hour;
    fortime();
  }

  fortime() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        second++;
        if (second > 59) {
          minite++;
          second = 0;
        }
        if (minite > 59) {
          hours++;

          minite = 0;
        }
      });
      fortime();
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    if (hours == 13) {
      hours = 1;
    } else if (hours == 14) {
      hours = 2;
    } else if (hours == 15) {
      hours = 3;
    } else if (hours == 16) {
      hours = 4;
    } else if (hours == 17) {
      hours = 5;
    } else if (hours == 18) {
      hours = 6;
    } else if (hours == 19) {
      hours = 7;
    } else if (hours == 20) {
      hours = 8;
    } else if (hours == 21) {
      hours = 9;
    } else if (hours == 22) {
      hours = 10;
    } else if (hours == 23) {
      hours = 11;
    } else if (hours == 24) {
      hours = 12;
    }

    //
    return Scaffold(
      body: (Globle.Switch)
          ? Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: _height,
                  width: _width,
                  child: Image.asset(
                    "images/bg.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Transform.scale(
                  scale: 5,
                  child: CircularProgressIndicator(
                    color: Colors.white.withOpacity(0.4),
                    backgroundColor: Colors.black.withOpacity(0.3),
                    value: second / 60,
                    strokeWidth: 3,
                  ),
                ),
                Transform.scale(
                  scale: 6.7,
                  child: CircularProgressIndicator(
                    color: Colors.white.withOpacity(0.7),
                    backgroundColor: Colors.black.withOpacity(0.3),
                    value: minite / 60,
                    strokeWidth: 2,
                  ),
                ),
                Transform.scale(
                  scale: 8.5,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.black.withOpacity(0.3),
                    value: hours / 12,
                    strokeWidth: 1.7,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 320,
                  width: 320,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.4)),
                    gradient: RadialGradient(
                      colors: [
                        Colors.white.withOpacity(0.3),
                        Colors.grey.withOpacity(0.2),
                      ],
                    ),
                  ),
                  child: Text(
                    "$hours : $minite : $second",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const Positioned(
                  top: 690,
                  child: Text(
                    "Press Here",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 700,
                  child: TextButton(
                    child: const Text(
                      "Analog Watch",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        Globle.Switch = !Globle.Switch;
                      });
                    },
                  ),
                ),
              ],
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: _height,
                  width: _width,
                  child: Image.asset(
                    "images/bg.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                // Second
                Transform.rotate(
                  angle:
                      (second * (pi * 2 / 60)) + (pi / 2), //(second * 6) + 90,
                  child: const Divider(
                    color: Colors.white,
                    indent: 70,
                    endIndent: 175,
                    thickness: 1.1,
                  ),
                ),
                // Minite
                Transform.rotate(
                  angle:
                      (minite * (pi * 2 / 60)) + (pi / 2), //(minite * 6) + 90,
                  child: const Divider(
                    color: Colors.white,
                    indent: 90,
                    endIndent: 175,
                    thickness: 2,
                  ),
                ),
                // Hours
                Transform.rotate(
                  angle: ((hours - 1) * (pi * 2 / 12)) +
                      (pi / 2), //(hours * 6) + 90,
                  child: Transform.rotate(
                    angle: hours / 9.5,
                    child: const Divider(
                      color: Colors.white,
                      indent: 120,
                      endIndent: 175,
                      thickness: 3.5,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 320,
                  width: 320,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.4)),
                    gradient: RadialGradient(
                      colors: [
                        Colors.white.withOpacity(0.3),
                        Colors.grey.withOpacity(0.2),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 600,
                  child: Text(
                    "$hours : $minite : $second",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const Positioned(
                  top: 690,
                  child: Text(
                    "Press Here",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 700,
                  child: TextButton(
                    child: const Text(
                      "Digital Watch",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        Globle.Switch = !Globle.Switch;
                      });
                    },
                  ),
                ),
                const Positioned(
                  top: 378,
                  left: 30,
                  child: Text(
                    " 9                                  3",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      height: 1.4,
                    ),
                  ),
                ),
                const Positioned(
                  top: 245,
                  left: 162,
                  child: Text(
                    "12\n\n\n\n\n\n6",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
