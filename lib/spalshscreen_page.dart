// ignore_for_file: camel_case_types, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, sort_child_properties_last

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: spalsh_page(),
    ),
  );
}

class spalsh_page extends StatefulWidget {
  @override
  State<spalsh_page> createState() => _spalsh_pageState();
}

class _spalsh_pageState extends State<spalsh_page> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed("start_page"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/companyLogo-removebg-preview.png",
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 10),
            Text(
              "General Store",
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                fontSize: 40,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            SpinKitWave(
              color: Colors.black.withOpacity(0.5),
              size: 50,
              type: SpinKitWaveType.start,
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(241, 232, 232, 243),
    );
  }
}
