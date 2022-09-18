// ignore_for_file: camel_case_types, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: start_page(),
    ),
  );
}

class start_page extends StatefulWidget {
  @override
  State<start_page> createState() => _start_pageState();
}

class _start_pageState extends State<start_page> {
  final ImagePicker image = ImagePicker();

  String password = "ishan";

  @override
  Widget build(BuildContext context) {
    //
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    //
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   "images/companyLogo-removebg-preview.png",
            //   color: Colors.teal,
            // ),
            const Spacer(flex: 3),
            Image.asset(
              "images/Grosary-removebg-preview.png",
            ),
            const SizedBox(height: 30),
            Text(
              "Shop Your Daily\nNecessary",
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                fontSize: 33,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 50,
                width: 280,
                child: ElevatedButton(
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.ptSerif(
                      fontSize: 23,
                      letterSpacing: 1.2,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pushReplacementNamed("/");
                    });
                  },
                ),
              ),
            ),
            const Spacer(flex: 2),
            Row(
              children: [
                const SizedBox(width: 10),
                Image.asset(
                  "images/companyLogo-removebg-preview.png",
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 5),
                Text(
                  "Power By General Store Pvt. Ltd.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
