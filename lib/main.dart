import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: home(),
  ));
}

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  //
  Random random = Random();

  int box1 = 3, box2 = 4, box3 = 5, box4 = 6, box5 = 7, box6 = 8;

  int count = 0;

  List<Color> colors = [
    Color(0xff85586F),
    Color(0xff82954B),
    Colors.amber,
    Colors.blue,
    Colors.teal,
    Colors.orange,
    Colors.cyan,
    Colors.green,
    Colors.purple,
    Colors.indigo,
    Colors.pink.shade400,
    Colors.red.shade400,
    Color(0xffAC7D88),
    Color(0xffBABD42),
    Colors.amber.shade300,
    Colors.blue.shade300,
    Colors.teal.shade300,
    Colors.orange.shade300,
    Colors.cyan.shade300,
    Colors.green.shade300,
    Colors.purple.shade300,
    Colors.indigo.shade300,
    Colors.pink.shade300,
    Colors.red.shade300,
  ];

  Widget BoxSix({BorderRadius? borderradius, required Color colors}) {
    return Container(
      height: 65,
      width: 120,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: borderradius,
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Color Palette \n  Generator",
                style: TextStyle(
                    color: Color(0xff3bb3f9),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  BoxSix(
                    borderradius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    colors: colors[box1],
                  ),
                  BoxSix(colors: colors[box2]),
                  BoxSix(colors: colors[box3]),
                  BoxSix(colors: colors[box4]),
                  BoxSix(colors: colors[box5]),
                  BoxSix(
                    borderradius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    colors: colors[box6],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    count = colors.length;

                    box1 = random.nextInt(count);
                    box2 = random.nextInt(count);
                    box3 = random.nextInt(count);
                    box4 = random.nextInt(count);
                    box5 = random.nextInt(count);
                    box6 = random.nextInt(count);
                  });
                },
                child: Ink(
                  child: Container(
                    height: 60,
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff3bb3f9),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Generate",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xff3bb3f9),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
