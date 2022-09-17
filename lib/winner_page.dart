import 'package:flutter/material.dart';
import 'package:kbc_app/Global.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: winner_page(),
  ));
}

class winner_page extends StatefulWidget {
  @override
  State<winner_page> createState() => _winner_page();
}

class _winner_page extends State<winner_page> {
  @override
  Widget build(BuildContext context) {
    Object? winnerPrice = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'accets/fire-cracker-removebg-preview.png',
            height: 100,
          ),
          const SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            child: const Text(
              "Your Answer Is Correct",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            child: Text(
              "You Won\nRs.$winnerPrice ",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            height: 40,
            width: 165,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  //
                  if (Global.initialQustion < Global.questions.length - 1) {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  } else {
                    Navigator.of(context).pushNamed('gameover_page');
                  }
                });
              },
              child: Text(
                'Next',
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
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
