// ignore_for_file: camel_case_types, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Globle.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ownerDetailShowing_page(),
    ),
  );
}

class ownerDetailShowing_page extends StatefulWidget {
  @override
  State<ownerDetailShowing_page> createState() =>
      _ownerDetailShowing_pageState();
}

class _ownerDetailShowing_pageState extends State<ownerDetailShowing_page> {
  @override
  Widget build(BuildContext context) {
    //
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    List ownerList = [
      {
        'text': 'Customer',
        'text2': 'Details',
        'image': 'images/Customer-removebg-preview.png',
      },
      {
        'text': 'Produt',
        'text2': 'Stock',
        'image': 'images/Product_Stock-removebg-preview.png',
      },
    ];
    //
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "General Store",
          style: TextStyle(color: Colors.teal),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(240, 221, 221, 235),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[700],
          ),
          onPressed: () {
            setState(() {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/", (route) => false);
            });
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: ownerList.length,
              padding: const EdgeInsets.all(20),
              separatorBuilder: (context, i) => const Divider(
                color: Colors.black,
                thickness: 1,
                height: 50,
              ),
              itemBuilder: (context, i) => InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context)
                        .pushNamed("stockCheck_page", arguments: i);
                  });
                },
                child: Ink(
                  child: Container(
                    height: 100,
                    width: _width,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 1,
                              )
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Image.asset("${ownerList[i]['image']}"),
                        ),
                        const SizedBox(width: 30),
                        Column(
                          children: [
                            Text(
                              "${ownerList[i]['text']}",
                              style: GoogleFonts.josefinSans(
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              "${ownerList[i]['text2']}",
                              style: GoogleFonts.josefinSans(
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(241, 232, 232, 243),
    );
  }
}
