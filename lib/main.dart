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

  int i = 0, n = 0;
  int generateOTP = 0;

  List generateOtpContainer = [];

  Decoration myRadient = BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        Color(0xffffe8b8),
        Color(0xfff6db87),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    borderRadius: BorderRadius.circular(15),
  );

  TextStyle myStyle = const TextStyle(
    color: Color(0xff15172b),
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  TextEditingController numbersController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "OTP Generator",
                style: TextStyle(
                  color: Color(0xfff6db87),
                  fontSize: 30,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 250,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: TextField(
                  controller: numbersController,
                  style: const TextStyle(
                    color: Color(0xfff6db87),
                  ),
                  onChanged: (txt) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter OTP Length (4 To 8)",
                    hintStyle: TextStyle(
                      color: Color(0xfff6db87),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(
                    () {
                      generateOtpContainer.clear();

                      n = int.parse(numbersController.text);

                      if (n == 4 || n == 5 || n == 6 || n == 7 || n == 8) {
                        for (i = 0; i < n; i++) {
                          generateOTP = random.nextInt(10);
                          generateOtpContainer.add(generateOTP);
                        }
                      } else {
                        generateOtpContainer.add("Enetr Valid Number");
                      }
                    },
                  );
                },
                child: Ink(
                  child: Container(
                    height: 45,
                    width: 210,
                    alignment: Alignment.center,
                    decoration: myRadient,
                    child: Text(
                      "Generate OTP",
                      style: myStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 55,
            width: 280,
            decoration: myRadient,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: generateOtpContainer.map((e) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    "$e",
                    style: myStyle,
                  ),
                );
              }).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    generateOtpContainer.clear();
                  });
                },
                child: Ink(
                  child: Container(
                    height: 45,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: myRadient,
                    child: Text(
                      "Reset",
                      style: myStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Color(0xff15172b),
    );
  }
}
