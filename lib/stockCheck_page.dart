// ignore_for_file: camel_case_types, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Globle.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: stockCheck_page(),
    ),
  );
}

class stockCheck_page extends StatefulWidget {
  @override
  State<stockCheck_page> createState() => _stockCheck_pageState();
}

class _stockCheck_pageState extends State<stockCheck_page> {
  @override
  Widget build(BuildContext context) {
    //
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    dynamic res = ModalRoute.of(context)!.settings.arguments;

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
              Navigator.of(context).pop();
            });
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: res,
              children: [
                (Globle.dummycartShopping.isNotEmpty)
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(20),
                        itemCount: Globle.totalcustomers.length,
                        separatorBuilder: (context, i) =>
                            const SizedBox(height: 15),
                        itemBuilder: (context, i) => Container(
                          padding: const EdgeInsets.all(10),
                          width: _width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(),
                            //   boxShadow: const [
                            //     BoxShadow(
                            //       color: Colors.black,
                            //       blurRadius: 1,
                            //     )
                            //   ],
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              opacity: 0.2,
                              image: AssetImage("images/doller.jpg"),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name : ${Globle.totalcustomers[i].firstName} ${Globle.totalcustomers[i].lastName}",
                                style: GoogleFonts.josefinSans(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "No : ${Globle.totalcustomers[i].phoneNumber}",
                                style: GoogleFonts.josefinSans(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "Email : ${Globle.totalcustomers[i].email}",
                                style: GoogleFonts.josefinSans(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "Total Product : ${Globle.dummycartShopping[i].length}",
                                style: GoogleFonts.josefinSans(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Product Name : ",
                                style: GoogleFonts.josefinSans(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 3),
                              ...Globle.dummycartShopping[i]
                                  .map(
                                    (e) => Text(
                                      "    ${e['productName']} : ${e['count']} *  ${e['price']} = ${e['total']}",
                                      style: GoogleFonts.josefinSans(
                                        fontSize: 15,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              const Divider(
                                color: Colors.black,
                                thickness: 1,
                                height: 20,
                              ),
                              Text(
                                "Total Bill : ${Globle.totalBill[i]}",
                                style: GoogleFonts.josefinSans(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          const SizedBox(height: 60),
                          Image.asset(
                            "images/CustomerNotComing-removebg-preview.png",
                            height: 400,
                            width: 400,
                          ),
                          const SizedBox(height: 60),
                          Text(
                            "Customer Coming Very Soon",
                            style: GoogleFonts.josefinSans(
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 60),
                          const Divider(
                            color: Colors.black,
                            thickness: 1,
                            indent: 80,
                            endIndent: 80,
                          ),
                        ],
                      ),
                Column(
                  children: [
                    const SizedBox(height: 180),
                    Image.asset(
                      "images/comingsoon-removebg-preview.png",
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(height: 50),
                    Text(
                      "This Page Coming Very Soon",
                      style: GoogleFonts.josefinSans(
                        fontSize: 22,
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
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(241, 232, 232, 243),
    );
  }
}
