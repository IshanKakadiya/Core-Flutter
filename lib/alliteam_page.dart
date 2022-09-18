// ignore_for_file: camel_case_types, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_generate/Globle.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: alliteam_page(),
    ),
  );
}

class alliteam_page extends StatefulWidget {
  @override
  State<alliteam_page> createState() => _alliteam_pageState();
}

class _alliteam_pageState extends State<alliteam_page> {
  @override
  Widget build(BuildContext context) {
    //
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    //
    return Scaffold(
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
            Icons.menu,
            color: Colors.grey[700],
          ),
          onPressed: () {
            setState(() {
              Navigator.of(context).pushNamed("owner_page");
            });
          },
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.add_shopping_cart_sharp,
                  color: Colors.grey[700],
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("cartShopping_page");
                },
              ),
              (Globle.cartShopping.isEmpty)
                  ? Container()
                  : Positioned(
                      left: 22,
                      top: 2,
                      child: Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${Globle.cartShopping.length}",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              physics: const BouncingScrollPhysics(),
              itemCount: Globle.category.length,
              separatorBuilder: (context, i) => const SizedBox(height: 15),
              itemBuilder: (context, i) => InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed("singleiteam_page", arguments: i);
                },
                child: Ink(
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        opacity: 0.6,
                        fit: BoxFit.cover,
                        image: AssetImage("${Globle.category[i]['image']}"),
                      ),
                      border: Border.all(color: Colors.black, width: 1.5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 1,
                        )
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${Globle.category[i]['text']}",
                      style: GoogleFonts.josefinSans(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: _height * 0.075,
              width: _width,
              color: Colors.teal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("/", (route) => false);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.view_comfortable_sharp,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("customer_detail_page");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(241, 232, 232, 243),
    );
  }
}

// https://www.justinmind.com/prototyping/how-to-design-a-grocery-app-in-7-simple-steps
