// ignore_for_file: camel_case_types, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, sort_child_properties_last, avoid_function_literals_in_foreach_calls, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_generate/Globle.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: cartShopping_page(),
    ),
  );
}

class cartShopping_page extends StatefulWidget {
  @override
  State<cartShopping_page> createState() => _cartShopping_pageState();
}

class _cartShopping_pageState extends State<cartShopping_page> {
  @override
  void initState() {
    super.initState();

    Globle.sum = 0;

    for (int i = 0; i < Globle.cartShopping.length; i++) {
      Globle.sum += Globle.cartShopping[i]['total'];
    }

    print(Globle.cartShopping);
  }

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
            Icons.arrow_back,
            color: Colors.grey[700],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: (Globle.cartShopping.isNotEmpty)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "My Cart",
                    style: GoogleFonts.josefinSans(
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  flex: 9,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    itemCount: Globle.cartShopping.length,
                    separatorBuilder: (context, i) =>
                        const SizedBox(height: 15),
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
                            "${Globle.cartShopping[i]['image']}",
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5),
                              Text(
                                "${Globle.cartShopping[i]['productName']}",
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
                                    "\u{20B9} ${Globle.cartShopping[i]['price'] * Globle.cartShopping[i]['count']}",
                                    style: GoogleFonts.josefinSans(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 40),
                                  // Spacer(),
                                  Text(
                                    "Stock : ${Globle.cartShopping[i]['stock']}",
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
                                  FloatingActionButton(
                                    heroTag: null,
                                    child: const Icon(Icons.delete),
                                    mini: true,
                                    elevation: 0,
                                    backgroundColor: Colors.teal,
                                    onPressed: () {
                                      setState(() {
                                        Globle.cartShopping
                                            .remove(Globle.cartShopping[i]);

                                        Globle.sum = 0;

                                        for (int i = 0;
                                            i < Globle.cartShopping.length;
                                            i++) {
                                          Globle.sum +=
                                              Globle.cartShopping[i]['total'];
                                        }
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 30),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (1 <
                                            Globle.cartShopping[i]['count']) {
                                          Globle.cartShopping[i]['count']--;

                                          Globle.cartShopping[i]['total'] =
                                              Globle.cartShopping[i]['count'] *
                                                  Globle.cartShopping[i]
                                                      ['price'];

                                          Globle.sum = 0;

                                          for (int i = 0;
                                              i < Globle.cartShopping.length;
                                              i++) {
                                            Globle.sum +=
                                                Globle.cartShopping[i]['total'];
                                          }
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
                                    "${Globle.cartShopping[i]['count']}",
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
                                        if (Globle.cartShopping[i]['count'] <
                                            Globle.cartShopping[i]['stock']) {
                                          Globle.cartShopping[i]['count']++;

                                          Globle.cartShopping[i]['total'] =
                                              Globle.cartShopping[i]['count'] *
                                                  Globle.cartShopping[i]
                                                      ['price'];

                                          Globle.sum = 0;

                                          for (int i = 0;
                                              i < Globle.cartShopping.length;
                                              i++) {
                                            Globle.sum +=
                                                Globle.cartShopping[i]['total'];
                                          }
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
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: Container(
                    height: _height * 0.075,
                    width: _width,
                    color: Colors.teal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Pay",
                              style: GoogleFonts.josefinSans(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "\u{20B9} ${Globle.sum}",
                              style: GoogleFonts.josefinSans(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(flex: 2),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 20,
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                )),
                            onPressed: () {
                              setState(() {
                                if (Globle.signin == true) {
                                  Globle.logout = false;
                                  if (Globle.total) {
                                    Globle.dummycartShopping
                                        .add(Globle.cartShopping);
                                    Globle.total = false;
                                    Globle.totalBill.add(Globle.sum);
                                  } else {
                                    Globle.totalBill.removeLast();
                                    Globle.totalBill.add(Globle.sum);
                                  }

                                  Navigator.of(context).pushNamed("pdf_page");
                                  print("========================");
                                  print(Globle.dummycartShopping);
                                  print("========================");
                                } else {
                                  Navigator.of(context)
                                      .pushNamed("customer_detail_page");
                                }
                              });
                            },
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                const SizedBox(height: 110),
                Image.asset(
                  "images/cart.png",
                  height: 300,
                  width: 300,
                ),
                const SizedBox(height: 50),
                Text(
                  "There No Iteam Here",
                  style: GoogleFonts.josefinSans(
                    fontSize: 25,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      child: Text(
                        "SHOP NOW",
                        style: GoogleFonts.ptSerif(fontSize: 23),
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
                        Navigator.of(context).pushNamed("alliteam_page");
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 80,
                  endIndent: 80,
                ),
              ],
            ),
      backgroundColor: const Color.fromARGB(241, 232, 232, 243),
    );
  }
}

// https://www.justinmind.com/prototyping/how-to-design-a-grocery-app-in-7-simple-steps
