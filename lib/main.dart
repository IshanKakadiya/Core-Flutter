// ignore_for_file: camel_case_types, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_generate/Globle.dart';
import 'package:invoice_generate/alliteam_page.dart';
import 'package:invoice_generate/cartShopping_page.dart';
import 'package:invoice_generate/customer_detail_page.dart';
import 'package:invoice_generate/ownerDetailShowing_page.dart';
import 'package:invoice_generate/owner_page.dart';
import 'package:invoice_generate/pdf_page.dart';
import 'package:invoice_generate/singleiteam_page.dart';
import 'package:invoice_generate/spalshscreen_page.dart';
import 'package:invoice_generate/start_page.dart';
import 'package:invoice_generate/stockCheck_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "spalsh_page",
      routes: {
        "/": (context) => home(),
        "customer_detail_page": (context) => customer_detail_page(),
        "alliteam_page": (context) => alliteam_page(),
        "singleiteam_page": (context) => singleiteam_page(),
        "cartShopping_page": (context) => cartShopping_page(),
        "owner_page": (context) => owner_page(),
        "ownerDetailShowing_page": (context) => ownerDetailShowing_page(),
        "stockCheck_page": (context) => stockCheck_page(),
        "pdf_page": (context) => pdf_page(),
        "start_page": (context) => start_page(),
        "spalsh_page": (context) => spalsh_page(),
      },
    ),
  );
}

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Welcome.",
                      style: GoogleFonts.pacifico(
                        fontSize: 55,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.teal,
                    indent: 50,
                    endIndent: 50,
                  ),
                  const Text(
                    "New Items",
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    flex: 5,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: Globle.newiteam.length,
                      separatorBuilder: (context, i) =>
                          const SizedBox(width: 20),
                      itemBuilder: (context, i) => Container(
                        width: 317,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 1.5),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("${Globle.newiteam[i]['image']}")),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 140),
                            Row(
                              children: [
                                const Text(
                                  "  |",
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  "  ${Globle.newiteam[i]['category']}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                                const SizedBox(width: 10),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "  ${Globle.newiteam[i]['text']}",
                                  style: GoogleFonts.josefinSans(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  child: const Text("Expore"),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.teal[400]),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context)
                                          .pushNamed("alliteam_page");
                                    });
                                  },
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Top Offers",
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    flex: 4,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: Globle.category.length,
                      separatorBuilder: (context, i) =>
                          const SizedBox(width: 15),
                      itemBuilder: (context, i) => Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed("singleiteam_page", arguments: i);
                            },
                            child: Ink(
                              child: Container(
                                height: 140,
                                width: 140,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black, width: 1.5),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "${Globle.category[i]['image']}")),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${Globle.category[i]['text']}",
                            style: GoogleFonts.josefinSans(
                              color: Colors.teal,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
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
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.view_comfortable_sharp,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("alliteam_page");
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

