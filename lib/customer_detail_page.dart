// ignore_for_file: camel_case_types, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, sort_child_properties_last, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_generate/model/model.dart';

import 'Globle.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: customer_detail_page(),
    ),
  );
}

class customer_detail_page extends StatefulWidget {
  @override
  State<customer_detail_page> createState() => _customer_detail_pageState();
}

class _customer_detail_pageState extends State<customer_detail_page> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> signin = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    firstNameController.text = Globle.firstName;
    lastNameController.text = Globle.lastName;
    phoneNumberController.text = Globle.phoneNumber;
    emailController.text = Globle.email;
  }

  @override
  Widget build(BuildContext context) {
    //
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
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
      body: Form(
        key: signin,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text(
                "Welcome.",
                style: GoogleFonts.pacifico(
                  fontSize: 50,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: firstNameController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Frist Name";
                      }
                      return null;
                    },
                    cursorColor: Colors.teal,
                    cursorHeight: 25,
                    cursorWidth: 2,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 1)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2.5),
                      ),
                      hintText: "Enter First Name",
                      hintStyle: Globle.hintText,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: lastNameController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Last Name";
                      }
                      return null;
                    },
                    cursorColor: Colors.teal,
                    cursorHeight: 25,
                    cursorWidth: 2,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 1)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2.5),
                      ),
                      hintText: "Enter Last Name",
                      hintStyle: Globle.hintText,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Phone No";
                      }
                      return null;
                    },
                    cursorColor: Colors.teal,
                    cursorHeight: 25,
                    cursorWidth: 2,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 1)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2.5),
                      ),
                      hintText: "Enter Phone No",
                      hintStyle: Globle.hintText,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: emailController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Email";
                      }
                      return null;
                    },
                    cursorColor: Colors.teal,
                    cursorHeight: 25,
                    cursorWidth: 2,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 1)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2.5),
                      ),
                      hintText: "Enter Email",
                      hintStyle: Globle.hintText,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  child: Text(
                    "Sign In",
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
                    if (signin.currentState!.validate()) {
                      Customer customers = Customer(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        phoneNumber: phoneNumberController.text,
                        email: emailController.text,
                      );
                      setState(() {
                        Globle.totalcustomers.add(customers);

                        Globle.firstName = firstNameController.text;
                        Globle.lastName = lastNameController.text;
                        Globle.phoneNumber = phoneNumberController.text;
                        Globle.email = emailController.text;
                        Globle.signin = true;
                      });
                    }
                  },
                ),
              ),
            ),
            (Globle.signin == false)
                ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Frist Sign In Then You Can Buy",
                      style: GoogleFonts.ptSerif(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Container(),
            (Globle.logout == false)
                ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        child: Text(
                          "Log Out",
                          style: GoogleFonts.ptSerif(fontSize: 23),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Globle.cartShopping = [];
                            Globle.signin = false;
                            Globle.total = true;
                            Globle.logout = true;
                            Globle.firstName = "";
                            Globle.lastName = "";
                            Globle.phoneNumber = "";
                            Globle.email = "";
                            firstNameController.text = Globle.firstName;
                            lastNameController.text = Globle.lastName;
                            phoneNumberController.text = Globle.phoneNumber;
                            emailController.text = Globle.email;
                            Globle.product1 = [
                              {
                                'total': 0,
                                'image': 'images/Cabbage.png',
                                'productName': 'Cabbange',
                                'price': 50,
                                'count': 1,
                                'bool': true,
                                'stock': 3
                              },
                              {
                                'id': 2,
                                'image': 'images/Carrot.png',
                                'productName': 'Carrot',
                                'price': 70,
                                'count': 1,
                                'bool': true,
                                'stock': 3
                              },
                              {
                                'id': 3,
                                'image': 'images/Tomato.png',
                                'productName': 'Tomato',
                                'price': 30,
                                'count': 1,
                                'bool': true,
                                'stock': 3
                              },
                              {
                                'id': 4,
                                'image': 'images/Broccoli.png',
                                'productName': 'Broccoli',
                                'price': 100,
                                'count': 1,
                                'bool': true,
                                'stock': 3
                              },
                              {
                                'id': 5,
                                'image': 'images/Potato.png',
                                'productName': 'Potato',
                                'price': 100,
                                'count': 1,
                                'bool': true,
                                'stock': 3
                              },
                              {
                                'id': 6,
                                'image': 'images/Onion.png',
                                'productName': 'Onion',
                                'price': 100,
                                'count': 1,
                                'bool': true,
                                'stock': 3
                              },
                              {
                                'id': 7,
                                'image': 'images/Cucumber.png',
                                'productName': 'Cucumber',
                                'price': 100,
                                'count': 1,
                                'bool': true,
                                'stock': 3
                              },
                              {
                                'id': 8,
                                'image': 'images/Corn.png',
                                'productName': 'Corn',
                                'price': 100,
                                'count': 1,
                                'bool': true,
                                'stock': 3
                              },
                              {
                                'id': 9,
                                'image': 'images/Eggplant.png',
                                'productName': 'Eggplant',
                                'price': 100,
                                'count': 1,
                                'bool': true,
                                'stock': 3
                              },
                            ];
                            Globle.coffeeTea = [
                              {
                                'total': 0,
                                'image': 'images/resLabel.png',
                                'productName': 'Red Label.png',
                                'price': 50,
                                'count': 1,
                                'bool': true,
                                'stock': 30
                              },
                              {
                                'id': 2,
                                'image': 'images/Decaf.png',
                                'productName': 'Decaf',
                                'price': 80,
                                'count': 1,
                                'bool': true,
                                'stock': 10
                              },
                              {
                                'id': 3,
                                'image': 'images/Tata Tea.png',
                                'productName': 'Tata Tea',
                                'price': 90,
                                'count': 1,
                                'bool': true,
                                'stock': 35
                              },
                              {
                                'id': 4,
                                'image': 'images/Tata Gold.png',
                                'productName': 'Tata Gold',
                                'price': 200,
                                'count': 1,
                                'bool': true,
                                'stock': 30
                              },
                              {
                                'id': 5,
                                'image': 'images/Tata Leaf.png',
                                'productName': 'Tata Leaf',
                                'price': 150,
                                'count': 1,
                                'bool': true,
                                'stock': 100
                              },
                              {
                                'id': 6,
                                'image': 'images/Kanan Devan.png',
                                'productName': 'Kanan Devan',
                                'price': 700,
                                'count': 1,
                                'bool': true,
                                'stock': 120
                              },
                              {
                                'id': 7,
                                'image': 'images/Teaveda.png',
                                'productName': 'Teaveda',
                                'price': 300,
                                'count': 1,
                                'bool': true,
                                'stock': 2
                              },
                              {
                                'id': 8,
                                'image': 'images/Red Sun Coffee.webp',
                                'productName': 'Red Sun Coffee',
                                'price': 200,
                                'count': 1,
                                'bool': true,
                                'stock': 80
                              },
                              {
                                'id': 9,
                                'image': 'images/Perfecto Coffee.webp',
                                'productName': 'Perfecto Coffee',
                                'price': 150,
                                'count': 1,
                                'bool': true,
                                'stock': 35
                              },
                              {
                                'id': 10,
                                'image': 'images/Masala Tea.webp',
                                'productName': 'Masala Tea',
                                'price': 300,
                                'count': 1,
                                'bool': true,
                                'stock': 50
                              },
                              {
                                'id': 11,
                                'image': 'images/Gorgeous Coffee.png',
                                'productName': 'Gorgeous Coffee',
                                'price': 100,
                                'count': 1,
                                'bool': true,
                                'stock': 20
                              },
                            ];
                            Globle.fruit = [
                              {
                                'total': 0,
                                'image': 'images/Orange.png',
                                'productName': 'Orange',
                                'price': 50,
                                'count': 1,
                                'bool': true,
                                'stock': 30
                              },
                              {
                                'id': 2,
                                'image': 'images/Mango.png',
                                'productName': 'Mango',
                                'price': 90,
                                'count': 1,
                                'bool': true,
                                'stock': 10
                              },
                              {
                                'id': 3,
                                'image': 'images/Strawberry.png',
                                'productName': 'Strawberry',
                                'price': 80,
                                'count': 1,
                                'bool': true,
                                'stock': 90
                              },
                              {
                                'id': 4,
                                'image': 'images/Pineapple.png',
                                'productName': 'Pineapple',
                                'price': 90,
                                'count': 1,
                                'bool': true,
                                'stock': 71
                              },
                              {
                                'id': 5,
                                'image': 'images/Grape.png',
                                'productName': 'Grape',
                                'price': 60,
                                'count': 1,
                                'bool': true,
                                'stock': 36
                              },
                              {
                                'id': 6,
                                'image': 'images/Banana.png',
                                'productName': 'Banana',
                                'price': 30,
                                'count': 1,
                                'bool': true,
                                'stock': 12
                              },
                              {
                                'id': 7,
                                'image': 'images/Apple.png',
                                'productName': 'Apple',
                                'price': 55,
                                'count': 1,
                                'bool': true,
                                'stock': 46
                              },
                              {
                                'id': 8,
                                'image': 'images/Pomegranate.png',
                                'productName': 'Pomegranate',
                                'price': 35,
                                'count': 1,
                                'bool': true,
                                'stock': 34
                              },
                              {
                                'id': 9,
                                'image': 'images/Kiwi.png',
                                'productName': 'Kiwi',
                                'price': 70,
                                'count': 1,
                                'bool': true,
                                'stock': 30
                              },
                              {
                                'id': 10,
                                'image': 'images/Cherries.png',
                                'productName': 'Cherries',
                                'price': 85,
                                'count': 1,
                                'bool': true,
                                'stock': 35
                              },
                            ];
                            Globle.dairy = [
                              {
                                'total': 0,
                                'image':
                                    'images/Chocolate/5_Star-removebg-preview.png',
                                'productName': '5 Star',
                                'price': 10,
                                'count': 1,
                                'bool': true,
                                'stock': 300
                              },
                              {
                                'id': 2,
                                'image': 'images/Chocolate/Bournvile.png',
                                'productName': 'Bournvile',
                                'price': 120,
                                'count': 1,
                                'bool': true,
                                'stock': 30
                              },
                              {
                                'id': 3,
                                'image':
                                    'images/Chocolate/Cadbury_Dairy_Milk-removebg-preview.png',
                                'productName': 'Cadbury Dairy Milk',
                                'price': 20,
                                'count': 1,
                                'bool': true,
                                'stock': 50
                              },
                              {
                                'id': 4,
                                'image':
                                    'images/Chocolate/Chocolate Bar Cake.png',
                                'productName': 'Chocolate Bar Cake',
                                'price': 70,
                                'count': 1,
                                'bool': true,
                                'stock': 12
                              },
                              {
                                'id': 5,
                                'image':
                                    'images/Chocolate/Dairy_Milk_Mini-removebg-preview.png',
                                'productName': 'Dairy Milk Mini',
                                'price': 20,
                                'count': 1,
                                'bool': true,
                                'stock': 30
                              },
                              {
                                'id': 6,
                                'image':
                                    'images/Chocolate/Dart_Chocolate-removebg-preview.png',
                                'productName': 'Dart Chocolate',
                                'price': 30,
                                'count': 1,
                                'bool': true,
                                'stock': 10
                              },
                              {
                                'id': 7,
                                'image':
                                    'images/Chocolate/Hazel_Nut-removebg-preview.png',
                                'productName': 'Hazel Nut',
                                'price': 20,
                                'count': 1,
                                'bool': true,
                                'stock': 15
                              },
                              {
                                'id': 8,
                                'image':
                                    'images/Chocolate/Kit_Kat-removebg-preview.png',
                                'productName': 'Kit Kat',
                                'price': 25,
                                'count': 1,
                                'bool': true,
                                'stock': 300
                              },
                              {
                                'id': 9,
                                'image':
                                    'images/Chocolate/Silk_Bubbly-removebg-preview.png',
                                'productName': 'Silk_Bubbly',
                                'price': 100,
                                'count': 1,
                                'bool': true,
                                'stock': 3
                              },
                            ];
                            Globle.softDrinks = [
                              {
                                'total': 0,
                                'image':
                                    'images/softDrinks/7up-removebg-preview (1).png',
                                'productName': '7 Up',
                                'price': 20,
                                'count': 1,
                                'bool': true,
                                'stock': 300
                              },
                              {
                                'id': 2,
                                'image':
                                    'images/softDrinks/Fanta-removebg-preview.png',
                                'productName': 'Fanta',
                                'price': 15,
                                'count': 1,
                                'bool': true,
                                'stock': 500
                              },
                              {
                                'id': 3,
                                'image':
                                    'images/softDrinks/Pepsi-removebg-preview.png',
                                'productName': 'Pepsi',
                                'price': 25,
                                'count': 1,
                                'bool': true,
                                'stock': 200
                              },
                              {
                                'id': 4,
                                'image':
                                    'images/softDrinks/Sprite-removebg-preview.png',
                                'productName': 'Sprite',
                                'price': 20,
                                'count': 1,
                                'bool': true,
                                'stock': 100
                              },
                              {
                                'id': 5,
                                'image':
                                    'images/softDrinks/Coca-Cola-removebg-preview.png',
                                'productName': 'Coca-Cola',
                                'price': 30,
                                'count': 1,
                                'bool': true,
                                'stock': 50
                              },
                              {
                                'id': 6,
                                'image':
                                    'images/softDrinks/7up Bottle-removebg-preview.png',
                                'productName': '7up Bottle',
                                'price': 15,
                                'count': 1,
                                'bool': true,
                                'stock': 30
                              },
                              {
                                'id': 7,
                                'image':
                                    'images/softDrinks/Coca-Cola_Bottle-removebg-preview.png',
                                'productName': 'Coca-Cola Bottle',
                                'price': 70,
                                'count': 1,
                                'bool': true,
                                'stock': 40
                              },
                              {
                                'id': 8,
                                'image':
                                    'images/softDrinks/FantaBottle-removebg-preview.png',
                                'productName': 'FantaBottle',
                                'price': 65,
                                'count': 1,
                                'bool': true,
                                'stock': 35
                              },
                              {
                                'id': 9,
                                'image':
                                    'images/softDrinks/Mirindia-removebg-preview.png',
                                'productName': 'Mirindia',
                                'price': 15,
                                'count': 1,
                                'bool': true,
                                'stock': 200
                              },
                              {
                                'id': 10,
                                'image':
                                    'images/softDrinks/Mirindia_Bottle-removebg-preview.png',
                                'productName': 'Mirindia Bottle',
                                'price': 60,
                                'count': 1,
                                'bool': true,
                                'stock': 70
                              },
                              {
                                'id': 11,
                                'image':
                                    'images/softDrinks/Sprite_Bottle-removebg-preview.png',
                                'productName': 'Sprite Bottle',
                                'price': 10,
                                'count': 1,
                                'bool': true,
                                'stock': 70
                              },
                            ];
                            Globle.biscuits = [
                              {
                                'total': 0,
                                'image':
                                    'images/Horlicks_Biscuit-removebg-preview.png',
                                'productName': 'Horlicks Biscuit',
                                'price': 10,
                                'count': 1,
                                'bool': true,
                                'stock': 100
                              },
                              {
                                'id': 2,
                                'image':
                                    'images/Milk_Biscuit-removebg-preview.png',
                                'productName': 'Milk Biscuit',
                                'price': 20,
                                'count': 1,
                                'bool': true,
                                'stock': 15
                              },
                              {
                                'id': 3,
                                'image':
                                    'images/Marie_Plus-removebg-preview.png',
                                'productName': 'Marie Plus',
                                'price': 25,
                                'count': 1,
                                'bool': true,
                                'stock': 40
                              },
                              {
                                'id': 4,
                                'image':
                                    'images/Magic_BourBon-removebg-preview.png',
                                'productName': 'Magic BourBon',
                                'price': 10,
                                'count': 1,
                                'bool': true,
                                'stock': 2
                              },
                              {
                                'id': 5,
                                'image':
                                    'images/Parle_20-20-removebg-preview.png',
                                'productName': 'Parle 20-20',
                                'price': 10,
                                'count': 1,
                                'bool': true,
                                'stock': 30
                              },
                              {
                                'id': 6,
                                'image': 'images/Parle-G-removebg-preview.png',
                                'productName': 'Parle-G',
                                'price': 10,
                                'count': 1,
                                'bool': true,
                                'stock': 3000
                              },
                              {
                                'id': 7,
                                'image':
                                    'images/Choclolate_Parle_G-removebg-preview.png',
                                'productName': 'Choclolate Parle-G',
                                'price': 15,
                                'count': 1,
                                'bool': true,
                                'stock': 1500
                              },
                              {
                                'id': 8,
                                'image':
                                    'images/Hide___Seek_Parle-removebg-preview.png',
                                'productName': 'Hide Seek Parle',
                                'price': 30,
                                'count': 1,
                                'bool': true,
                                'stock': 300
                              },
                              {
                                'id': 9,
                                'image':
                                    'images/Britannia_50-50-removebg-preview.png',
                                'productName': 'Britannia 50-50',
                                'price': 35,
                                'count': 1,
                                'bool': true,
                                'stock': 97
                              },
                            ];
                            Globle.bakery = [
                              {
                                'total': 0,
                                'image':
                                    'images/Pastry_Cake-removebg-preview.png',
                                'productName': 'Pastry Cake',
                                'price': 70,
                                'count': 1,
                                'bool': true,
                                'stock': 10
                              },
                              {
                                'id': 2,
                                'image':
                                    'images/Cake_Powder-removebg-preview.png',
                                'productName': 'Cake Powder',
                                'price': 50,
                                'count': 1,
                                'bool': true,
                                'stock': 67
                              },
                              {
                                'id': 3,
                                'image':
                                    'images/Sliced_bread-removebg-preview.png',
                                'productName': 'Sliced bread',
                                'price': 25,
                                'count': 1,
                                'bool': true,
                                'stock': 49
                              },
                              {
                                'id': 4,
                                'image':
                                    'images/Ladu_Sweets-removebg-preview.png',
                                'productName': 'Ladu Sweets',
                                'price': 300,
                                'count': 1,
                                'bool': true,
                                'stock': 10
                              },
                              {
                                'id': 5,
                                'image': 'images/Khorak Mithai.jpg',
                                'productName': 'Khorak Mithai',
                                'price': 700,
                                'count': 1,
                                'bool': true,
                                'stock': 5
                              },
                              {
                                'id': 6,
                                'image':
                                    'images/Rasgulla_Sweets-removebg-preview.png',
                                'productName': 'Rasgulla Sweets',
                                'price': 900,
                                'count': 1,
                                'bool': true,
                                'stock': 15
                              },
                              {
                                'id': 7,
                                'image': 'images/Cake.png',
                                'productName': 'Cake',
                                'price': 300,
                                'count': 1,
                                'bool': true,
                                'stock': 5
                              },
                            ];
                            Globle.chips = [
                              {
                                'total': 0,
                                'image': 'images/Potato Chips.png',
                                'productName': 'Potato Chips',
                                'price': 20,
                                'count': 1,
                                'bool': true,
                                'stock': 100
                              },
                              {
                                'id': 2,
                                'image': 'images/Bingo Potato Chips.png',
                                'productName': 'Bingo Potato Chips',
                                'price': 10,
                                'count': 1,
                                'bool': true,
                                'stock': 150
                              },
                              {
                                'id': 3,
                                'image':
                                    'images/Lays_Family_Pack-removebg-preview.png',
                                'productName': 'Lays Family Pack',
                                'price': 90,
                                'count': 1,
                                'bool': true,
                                'stock': 200
                              },
                              {
                                'id': 4,
                                'image':
                                    'images/Tangy_Tomato-removebg-preview.png',
                                'productName': 'Tangy Tomato',
                                'price': 15,
                                'count': 1,
                                'bool': true,
                                'stock': 500
                              },
                              {
                                'id': 5,
                                'image':
                                    'images/Hot_Plavored_Tomato_Chips-removebg-preview.png',
                                'productName': 'Hot Tomato Chips',
                                'price': 10,
                                'count': 1,
                                'bool': true,
                                'stock': 50
                              },
                              {
                                'id': 6,
                                'image': 'images/Stack Up Balaji.png',
                                'productName': 'Stack Up Balaji',
                                'price': 199,
                                'count': 1,
                                'bool': true,
                                'stock': 5
                              },
                              {
                                'id': 7,
                                'image': 'images/Balaji Potato Wafers.png',
                                'productName': 'Balaji Potato Wafers',
                                'price': 10,
                                'count': 1,
                                'bool': true,
                                'stock': 500
                              },
                              {
                                'id': 8,
                                'image': 'images/Balaji Tomato Wafers.png',
                                'productName': 'Balaji Tomato Wafers',
                                'price': 5,
                                'count': 1,
                                'bool': true,
                                'stock': 1000
                              },
                              {
                                'id': 9,
                                'image': 'images/Euro Chips.png',
                                'productName': 'Euro Chips',
                                'price': 20,
                                'count': 1,
                                'bool': true,
                                'stock': 99
                              },
                              {
                                'id': 10,
                                'image': 'images/Classic Salted.png',
                                'productName': 'Classic Salted',
                                'price': 10,
                                'count': 1,
                                'bool': true,
                                'stock': 199
                              },
                            ];
                            Globle.engeryDrinks = [
                              {
                                'total': 0,
                                'image':
                                    'images/Monster_Engrgy-removebg-preview.png',
                                'productName': 'Monster Engrgy',
                                'price': 110,
                                'count': 1,
                                'bool': true,
                                'stock': 20
                              },
                              {
                                'total': 0,
                                'image': 'images/Red_Bull-removebg-preview.png',
                                'productName': 'Red Bull',
                                'price': 115,
                                'count': 1,
                                'bool': true,
                                'stock': 10
                              },
                              {
                                'total': 0,
                                'image': 'images/Sostoned-removebg-preview.png',
                                'productName': 'Sostoned',
                                'price': 80,
                                'count': 1,
                                'bool': true,
                                'stock': 1
                              },
                              {
                                'total': 0,
                                'image': 'images/7_Star-removebg-preview.png',
                                'productName': '7 Star',
                                'price': 65,
                                'count': 1,
                                'bool': true,
                                'stock': 50
                              },
                              {
                                'total': 0,
                                'image': 'images/Burn-removebg-preview.png',
                                'productName': 'Burn',
                                'price': 70,
                                'count': 1,
                                'bool': true,
                                'stock': 11
                              },
                              {
                                'total': 0,
                                'image':
                                    'images/Power_Horse-removebg-preview.png',
                                'productName': 'Power Horse',
                                'price': 90,
                                'count': 1,
                                'bool': true,
                                'stock': 25
                              },
                              {
                                'total': 0,
                                'image': 'images/HELL-removebg-preview.png',
                                'productName': 'HELL',
                                'price': 80,
                                'count': 1,
                                'bool': true,
                                'stock': 56
                              },
                              {
                                'total': 0,
                                'image': 'images/Spike-removebg-preview.png',
                                'productName': 'Spike',
                                'price': 110,
                                'count': 1,
                                'bool': true,
                                'stock': 67
                              },
                              {
                                'total': 0,
                                'image': 'images/Speed-removebg-preview.png',
                                'productName': 'Speed',
                                'price': 150,
                                'count': 1,
                                'bool': true,
                                'stock': 23
                              },
                              {
                                'total': 0,
                                'image': 'images/Sting-removebg-preview.png',
                                'productName': 'Sting',
                                'price': 75,
                                'count': 1,
                                'bool': true,
                                'stock': 10
                              },
                            ];
                          });
                        },
                      ),
                    ),
                  )
                : Container(),
            const Spacer(),
            Container(
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
                      Navigator.of(context).pushNamed("alliteam_page");
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(241, 232, 232, 243),
    );
  }
}
