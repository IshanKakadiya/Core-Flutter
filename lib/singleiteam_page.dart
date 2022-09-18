// ignore_for_file: camel_case_types, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_generate/Globle.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: singleiteam_page(),
    ),
  );
}

class singleiteam_page extends StatefulWidget {
  @override
  State<singleiteam_page> createState() => _singleiteam_pageState();
}

class _singleiteam_pageState extends State<singleiteam_page> {
  @override
  Widget build(BuildContext context) {
    //
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    dynamic res = ModalRoute.of(context)!.settings.arguments;
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
            Icons.arrow_back,
            color: Colors.grey[700],
          ),
          onPressed: () {
            Navigator.of(context).pop();
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
                  setState(() {
                    Navigator.of(context).pushNamed("cartShopping_page");
                  });
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "${Globle.category[res]['text']}",
              style: GoogleFonts.josefinSans(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            flex: 10,
            child: IndexedStack(
              index: res,
              children: [
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  itemCount: Globle.product1.length,
                  separatorBuilder: (context, i) => const SizedBox(height: 15),
                  itemBuilder: (context, i) => Container(
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: _width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      //   boxShadow: const [
                      //     BoxShadow(
                      //       color: Colors.black,
                      //       blurRadius: 1,
                      //     )
                      //   ],
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Image.asset(
                          "${Globle.product1[i]['image']}",
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              "${Globle.product1[i]['productName']}",
                              style: GoogleFonts.josefinSans(
                                fontSize: 18,
                                color: Colors.teal,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "India",
                              style: GoogleFonts.josefinSans(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "\u{20B9} ${Globle.product1[i]['price'] * Globle.product1[i]['count']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 55),
                                Text(
                                  "Stock : ${Globle.product1[i]['stock']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 18,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: ElevatedButton(
                                    child: const Text("ADD"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.teal[400],
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (Globle.product1[i]['bool']) {
                                          Globle.product1[i]['bool'] = false;
                                          Globle.cartShopping
                                              .add(Globle.product1[i]);
                                        }
                                        Globle.product1[i]['total'] =
                                            Globle.product1[i]['count'] *
                                                Globle.product1[i]['price'];
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 15),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (1 < Globle.product1[i]['count']) {
                                        Globle.product1[i]['count']--;
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${Globle.product1[i]['count']}",
                                  style: const TextStyle(
                                    color: Colors.teal,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (Globle.product1[i]['count'] <
                                          Globle.product1[i]['stock']) {
                                        Globle.product1[i]['count']++;

                                        Globle.product1[i]['total'] =
                                            Globle.product1[i]['count'] *
                                                Globle.product1[i]['price'];
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  itemCount: Globle.coffeeTea.length,
                  separatorBuilder: (context, i) => const SizedBox(height: 15),
                  itemBuilder: (context, i) => Container(
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: _width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      //   boxShadow: const [
                      //     BoxShadow(
                      //       color: Colors.black,
                      //       blurRadius: 1,
                      //     )
                      //   ],
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Image.asset(
                          "${Globle.coffeeTea[i]['image']}",
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              "${Globle.coffeeTea[i]['productName']}",
                              style: GoogleFonts.josefinSans(
                                fontSize: 18,
                                color: Colors.teal,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "India",
                              style: GoogleFonts.josefinSans(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "\u{20B9} ${Globle.coffeeTea[i]['price'] * Globle.coffeeTea[i]['count']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 40),
                                // Spacer(),
                                Text(
                                  "Stock : ${Globle.coffeeTea[i]['stock']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 15,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: ElevatedButton(
                                    child: const Text("ADD"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.teal[400],
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (Globle.coffeeTea[i]['bool']) {
                                          Globle.coffeeTea[i]['bool'] = false;
                                          Globle.cartShopping
                                              .add(Globle.coffeeTea[i]);
                                        }
                                        Globle.coffeeTea[i]['total'] =
                                            Globle.coffeeTea[i]['count'] *
                                                Globle.coffeeTea[i]['price'];
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (1 < Globle.coffeeTea[i]['count']) {
                                        Globle.coffeeTea[i]['count']--;
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${Globle.coffeeTea[i]['count']}",
                                  style: const TextStyle(
                                    color: Colors.teal,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (Globle.coffeeTea[i]['count'] <
                                          Globle.coffeeTea[i]['stock']) {
                                        Globle.coffeeTea[i]['count']++;

                                        Globle.coffeeTea[i]['total'] =
                                            Globle.coffeeTea[i]['count'] *
                                                Globle.coffeeTea[i]['price'];
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  itemCount: Globle.fruit.length,
                  separatorBuilder: (context, i) => const SizedBox(height: 15),
                  itemBuilder: (context, i) => Container(
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: _width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      //   boxShadow: const [
                      //     BoxShadow(
                      //       color: Colors.black,
                      //       blurRadius: 1,
                      //     )
                      //   ],
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Image.asset(
                          "${Globle.fruit[i]['image']}",
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              "${Globle.fruit[i]['productName']}",
                              style: GoogleFonts.josefinSans(
                                fontSize: 18,
                                color: Colors.teal,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "India",
                              style: GoogleFonts.josefinSans(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "\u{20B9} ${Globle.fruit[i]['price'] * Globle.fruit[i]['count']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 40),
                                // Spacer(),
                                Text(
                                  "Stock : ${Globle.fruit[i]['stock']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 15,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: ElevatedButton(
                                    child: const Text("ADD"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.teal[400],
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (Globle.fruit[i]['bool']) {
                                          Globle.fruit[i]['bool'] = false;
                                          Globle.cartShopping
                                              .add(Globle.fruit[i]);
                                        }
                                        Globle.fruit[i]['total'] =
                                            Globle.fruit[i]['count'] *
                                                Globle.fruit[i]['price'];
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (1 < Globle.fruit[i]['count']) {
                                        Globle.fruit[i]['count']--;
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${Globle.fruit[i]['count']}",
                                  style: const TextStyle(
                                    color: Colors.teal,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (Globle.fruit[i]['count'] <
                                          Globle.fruit[i]['stock']) {
                                        Globle.fruit[i]['count']++;

                                        Globle.fruit[i]['total'] =
                                            Globle.fruit[i]['count'] *
                                                Globle.fruit[i]['price'];
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  itemCount: Globle.dairy.length,
                  separatorBuilder: (context, i) => const SizedBox(height: 15),
                  itemBuilder: (context, i) => Container(
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: _width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      //   boxShadow: const [
                      //     BoxShadow(
                      //       color: Colors.black,
                      //       blurRadius: 1,
                      //     )
                      //   ],
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Image.asset(
                          "${Globle.dairy[i]['image']}",
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              "${Globle.dairy[i]['productName']}",
                              style: GoogleFonts.josefinSans(
                                fontSize: 18,
                                color: Colors.teal,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "India",
                              style: GoogleFonts.josefinSans(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "\u{20B9} ${Globle.dairy[i]['price'] * Globle.dairy[i]['count']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 40),
                                // Spacer(),
                                Text(
                                  "Stock : ${Globle.dairy[i]['stock']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 15,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: ElevatedButton(
                                    child: const Text("ADD"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.teal[400],
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (Globle.dairy[i]['bool']) {
                                          Globle.dairy[i]['bool'] = false;
                                          Globle.cartShopping
                                              .add(Globle.dairy[i]);
                                        }
                                        Globle.dairy[i]['total'] =
                                            Globle.dairy[i]['count'] *
                                                Globle.dairy[i]['price'];
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (1 < Globle.dairy[i]['count']) {
                                        Globle.dairy[i]['count']--;
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${Globle.dairy[i]['count']}",
                                  style: const TextStyle(
                                    color: Colors.teal,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (Globle.dairy[i]['count'] <
                                          Globle.dairy[i]['stock']) {
                                        Globle.dairy[i]['count']++;

                                        Globle.dairy[i]['total'] =
                                            Globle.dairy[i]['count'] *
                                                Globle.dairy[i]['price'];
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  itemCount: Globle.softDrinks.length,
                  separatorBuilder: (context, i) => const SizedBox(height: 15),
                  itemBuilder: (context, i) => Container(
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: _width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      //   boxShadow: const [
                      //     BoxShadow(
                      //       color: Colors.black,
                      //       blurRadius: 1,
                      //     )
                      //   ],
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Image.asset(
                          "${Globle.softDrinks[i]['image']}",
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              "${Globle.softDrinks[i]['productName']}",
                              style: GoogleFonts.josefinSans(
                                fontSize: 18,
                                color: Colors.teal,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "India",
                              style: GoogleFonts.josefinSans(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "\u{20B9} ${Globle.softDrinks[i]['price'] * Globle.softDrinks[i]['count']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 40),
                                // Spacer(),
                                Text(
                                  "Stock : ${Globle.softDrinks[i]['stock']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 15,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: ElevatedButton(
                                    child: const Text("ADD"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.teal[400],
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (Globle.softDrinks[i]['bool']) {
                                          Globle.softDrinks[i]['bool'] = false;
                                          Globle.cartShopping
                                              .add(Globle.softDrinks[i]);
                                        }
                                        Globle.softDrinks[i]['total'] =
                                            Globle.softDrinks[i]['count'] *
                                                Globle.softDrinks[i]['price'];
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (1 < Globle.softDrinks[i]['count']) {
                                        Globle.softDrinks[i]['count']--;
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${Globle.coffeeTea[i]['count']}",
                                  style: const TextStyle(
                                    color: Colors.teal,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (Globle.softDrinks[i]['count'] <
                                          Globle.softDrinks[i]['stock']) {
                                        Globle.softDrinks[i]['count']++;

                                        Globle.softDrinks[i]['total'] =
                                            Globle.softDrinks[i]['count'] *
                                                Globle.softDrinks[i]['price'];
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  itemCount: Globle.biscuits.length,
                  separatorBuilder: (context, i) => const SizedBox(height: 15),
                  itemBuilder: (context, i) => Container(
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: _width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      //   boxShadow: const [
                      //     BoxShadow(
                      //       color: Colors.black,
                      //       blurRadius: 1,
                      //     )
                      //   ],
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Image.asset(
                          "${Globle.biscuits[i]['image']}",
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              "${Globle.biscuits[i]['productName']}",
                              style: GoogleFonts.josefinSans(
                                fontSize: 18,
                                color: Colors.teal,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "India",
                              style: GoogleFonts.josefinSans(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "\u{20B9} ${Globle.biscuits[i]['price'] * Globle.biscuits[i]['count']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 40),
                                // Spacer(),
                                Text(
                                  "Stock : ${Globle.biscuits[i]['stock']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 15,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: ElevatedButton(
                                    child: const Text("ADD"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.teal[400],
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (Globle.biscuits[i]['bool']) {
                                          Globle.biscuits[i]['bool'] = false;
                                          Globle.cartShopping
                                              .add(Globle.biscuits[i]);
                                        }
                                        Globle.biscuits[i]['total'] =
                                            Globle.biscuits[i]['count'] *
                                                Globle.biscuits[i]['price'];
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (1 < Globle.biscuits[i]['count']) {
                                        Globle.biscuits[i]['count']--;
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${Globle.biscuits[i]['count']}",
                                  style: const TextStyle(
                                    color: Colors.teal,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (Globle.biscuits[i]['count'] <
                                          Globle.biscuits[i]['stock']) {
                                        Globle.biscuits[i]['count']++;

                                        Globle.biscuits[i]['total'] =
                                            Globle.biscuits[i]['count'] *
                                                Globle.biscuits[i]['price'];
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  itemCount: Globle.bakery.length,
                  separatorBuilder: (context, i) => const SizedBox(height: 15),
                  itemBuilder: (context, i) => Container(
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: _width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      //   boxShadow: const [
                      //     BoxShadow(
                      //       color: Colors.black,
                      //       blurRadius: 1,
                      //     )
                      //   ],
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Image.asset(
                          "${Globle.bakery[i]['image']}",
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              "${Globle.bakery[i]['productName']}",
                              style: GoogleFonts.josefinSans(
                                fontSize: 18,
                                color: Colors.teal,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "India",
                              style: GoogleFonts.josefinSans(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "\u{20B9} ${Globle.bakery[i]['price'] * Globle.bakery[i]['count']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 40),
                                // Spacer(),
                                Text(
                                  "Stock : ${Globle.bakery[i]['stock']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 15,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: ElevatedButton(
                                    child: const Text("ADD"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.teal[400],
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (Globle.bakery[i]['bool']) {
                                          Globle.bakery[i]['bool'] = false;
                                          Globle.cartShopping
                                              .add(Globle.bakery[i]);
                                        }

                                        Globle.bakery[i]['total'] =
                                            Globle.bakery[i]['count'] *
                                                Globle.bakery[i]['price'];
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (1 < Globle.bakery[i]['count']) {
                                        Globle.bakery[i]['count']--;
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${Globle.bakery[i]['count']}",
                                  style: const TextStyle(
                                    color: Colors.teal,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (Globle.bakery[i]['count'] <
                                          Globle.bakery[i]['stock']) {
                                        Globle.bakery[i]['count']++;

                                        Globle.bakery[i]['total'] =
                                            Globle.bakery[i]['count'] *
                                                Globle.bakery[i]['price'];
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  itemCount: Globle.chips.length,
                  separatorBuilder: (context, i) => const SizedBox(height: 15),
                  itemBuilder: (context, i) => Container(
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: _width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      //   boxShadow: const [
                      //     BoxShadow(
                      //       color: Colors.black,
                      //       blurRadius: 1,
                      //     )
                      //   ],
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Image.asset(
                          "${Globle.chips[i]['image']}",
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              "${Globle.chips[i]['productName']}",
                              style: GoogleFonts.josefinSans(
                                fontSize: 18,
                                color: Colors.teal,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "India",
                              style: GoogleFonts.josefinSans(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "\u{20B9} ${Globle.chips[i]['price'] * Globle.chips[i]['count']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 40),
                                // Spacer(),
                                Text(
                                  "Stock : ${Globle.chips[i]['stock']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 15,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: ElevatedButton(
                                    child: const Text("ADD"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.teal[400],
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (Globle.chips[i]['bool']) {
                                          Globle.chips[i]['bool'] = false;
                                          Globle.cartShopping
                                              .add(Globle.chips[i]);
                                        }
                                        Globle.chips[i]['total'] =
                                            Globle.chips[i]['count'] *
                                                Globle.chips[i]['price'];
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (1 < Globle.chips[i]['count']) {
                                        Globle.chips[i]['count']--;
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${Globle.chips[i]['count']}",
                                  style: const TextStyle(
                                    color: Colors.teal,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (Globle.chips[i]['count'] <
                                          Globle.chips[i]['stock']) {
                                        Globle.chips[i]['count']++;

                                        Globle.chips[i]['total'] =
                                            Globle.chips[i]['count'] *
                                                Globle.chips[i]['price'];
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  itemCount: Globle.engeryDrinks.length,
                  separatorBuilder: (context, i) => const SizedBox(height: 15),
                  itemBuilder: (context, i) => Container(
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    width: _width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      //   boxShadow: const [
                      //     BoxShadow(
                      //       color: Colors.black,
                      //       blurRadius: 1,
                      //     )
                      //   ],
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Image.asset(
                          "${Globle.engeryDrinks[i]['image']}",
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              "${Globle.engeryDrinks[i]['productName']}",
                              style: GoogleFonts.josefinSans(
                                fontSize: 18,
                                color: Colors.teal,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "India",
                              style: GoogleFonts.josefinSans(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "\u{20B9} ${Globle.engeryDrinks[i]['price'] * Globle.engeryDrinks[i]['count']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 40),
                                // Spacer(),
                                Text(
                                  "Stock : ${Globle.engeryDrinks[i]['stock']}",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 15,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: ElevatedButton(
                                    child: const Text("ADD"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.teal[400],
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (Globle.engeryDrinks[i]['bool']) {
                                          Globle.engeryDrinks[i]['bool'] =
                                              false;
                                          Globle.cartShopping
                                              .add(Globle.engeryDrinks[i]);
                                        }
                                        Globle.engeryDrinks[i]['total'] =
                                            Globle.engeryDrinks[i]['count'] *
                                                Globle.engeryDrinks[i]['price'];
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (1 < Globle.engeryDrinks[i]['count']) {
                                        Globle.engeryDrinks[i]['count']--;
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${Globle.engeryDrinks[i]['count']}",
                                  style: const TextStyle(
                                    color: Colors.teal,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (Globle.engeryDrinks[i]['count'] <
                                          Globle.engeryDrinks[i]['stock']) {
                                        Globle.engeryDrinks[i]['count']++;

                                        Globle.engeryDrinks[i]['total'] =
                                            Globle.engeryDrinks[i]['count'] *
                                                Globle.engeryDrinks[i]['price'];
                                      }
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
