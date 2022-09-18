// ignore_for_file: camel_case_types, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, sort_child_properties_last, avoid_print

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'Globle.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: pdf_page(),
    ),
  );
}

class pdf_page extends StatefulWidget {
  @override
  State<pdf_page> createState() => _pdf_pageState();
}

class _pdf_pageState extends State<pdf_page> {
  final pdf = pw.Document();

  imagesave() async {
    Globle.assetMemoryImage =
        (await rootBundle.load('images/companyLogo-removebg-preview.png'))
            .buffer
            .asUint8List();
  }

  savePdf() async {
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Container(
              margin: const pw.EdgeInsets.all(15),
              padding: const pw.EdgeInsets.all(10),
              height: 550,
              width: double.infinity,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      (Globle.galleryFile != null)
                          ? pw.Container(
                              height: 50,
                              width: 50,
                              decoration: pw.BoxDecoration(
                                shape: pw.BoxShape.circle,
                                image: pw.DecorationImage(
                                  image: pw.MemoryImage(
                                    Globle.memoryImage as Uint8List,
                                  ),
                                ),
                              ),
                            )
                          : pw.Container(
                              height: 50,
                              width: 50,
                              decoration: pw.BoxDecoration(
                                shape: pw.BoxShape.circle,
                                image: pw.DecorationImage(
                                  image: pw.MemoryImage(
                                    Globle.assetMemoryImage as Uint8List,
                                  ),
                                ),
                              ),
                            ),
                      pw.SizedBox(width: 20),
                      pw.Text(
                        "General Store",
                        style: const pw.TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(
                    thickness: 1,
                    height: 20,
                  ),
                  pw.SizedBox(width: 20),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Customer Details --",
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.Divider(
                        thickness: 1,
                        endIndent: 260,
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        softWrap: false,
                        maxLines: 3,
                        "Name : ${Globle.totalcustomers[0].firstName} ${Globle.totalcustomers[0].lastName}",
                        style: const pw.TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        "No     : ${Globle.totalcustomers[0].phoneNumber}",
                        style: const pw.TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        maxLines: 3,
                        softWrap: false,
                        "Email : ${Globle.totalcustomers[0].email}",
                        style: const pw.TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      pw.SizedBox(height: 10),
                    ],
                  ),
                  pw.Divider(
                    thickness: 1,
                    height: 20,
                  ),
                  pw.Row(
                    children: [
                      pw.SizedBox(width: 40),
                      pw.Text("ProductName"),
                      pw.SizedBox(width: 80),
                      pw.Text("Quntity"),
                      pw.SizedBox(width: 70),
                      pw.Text("Price"),
                      pw.SizedBox(width: 40),
                      pw.Text("Total Price"),
                    ],
                  ),
                  pw.Divider(
                    thickness: 1,
                    height: 20,
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        flex: 4,
                        child: pw.ListView.separated(
                          itemCount: Globle.cartShopping.length,
                          separatorBuilder: (context, i) =>
                              pw.SizedBox(height: 1),
                          itemBuilder: (context, i) => pw.Text(
                            textAlign: pw.TextAlign.left,
                            textDirection: pw.TextDirection.ltr,
                            "${Globle.cartShopping[i]['productName']}",
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 3,
                        child: pw.ListView.separated(
                          itemCount: Globle.cartShopping.length,
                          separatorBuilder: (context, i) =>
                              pw.SizedBox(height: 1),
                          itemBuilder: (context, i) => pw.Text(
                            textAlign: pw.TextAlign.left,
                            textDirection: pw.TextDirection.ltr,
                            "${Globle.cartShopping[i]['count']}",
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.ListView.separated(
                          itemCount: Globle.cartShopping.length,
                          separatorBuilder: (context, i) =>
                              pw.SizedBox(height: 1),
                          itemBuilder: (context, i) => pw.Text(
                            textAlign: pw.TextAlign.left,
                            textDirection: pw.TextDirection.ltr,
                            "${Globle.cartShopping[i]['price']}",
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.ListView.separated(
                          itemCount: Globle.cartShopping.length,
                          separatorBuilder: (context, i) =>
                              pw.SizedBox(height: 1),
                          itemBuilder: (context, i) => pw.Text(
                            textAlign: pw.TextAlign.left,
                            textDirection: pw.TextDirection.ltr,
                            "${Globle.cartShopping[i]['total']}",
                          ),
                        ),
                      ),
                    ],
                  ),
                  pw.Spacer(),
                  pw.Divider(
                    thickness: 1,
                    height: 20,
                  ),
                  pw.Row(
                    children: [
                      pw.Spacer(),
                      pw.Text(
                        "Total Amount :",
                      ),
                      pw.Text(
                        " ${Globle.sum}",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Directory dir = await getTemporaryDirectory();

    File file = File("${dir.path}/invoice.pdf");

    file.writeAsBytes(await pdf.save());
  }

  @override
  void initState() {
    super.initState();
    imagesave();
    savePdf();
  }

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
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/", (route) => false);
            });
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            height: 550,
            width: _width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (Globle.galleryFile == null)
                        ? const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                                "images/companyLogo-removebg-preview.png"),
                          )
                        : CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.transparent,
                            backgroundImage: FileImage(Globle.galleryFile!),
                          ),

                    // FileImage(Globle.galleryFile!),
                    const SizedBox(width: 20),
                    Text(
                      "General Store",
                      style: GoogleFonts.josefinSans(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 20,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customer Details --",
                      style: GoogleFonts.josefinSans(
                        fontSize: 20,
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                      endIndent: 150,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      softWrap: false,
                      maxLines: 3,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      "Name : ${Globle.totalcustomers[0].firstName} ${Globle.totalcustomers[0].lastName}",
                      style: GoogleFonts.josefinSans(
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "No     : ${Globle.totalcustomers[0].phoneNumber}",
                      style: GoogleFonts.josefinSans(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      maxLines: 3,
                      softWrap: false,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      "Email : ${Globle.totalcustomers[0].email}",
                      style: GoogleFonts.josefinSans(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Row(
                  children: const [
                    Expanded(
                      flex: 4,
                      child: Text("ProductName"),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text("Quntity"),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text("Price"),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text("Total Price"),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: Globle.cartShopping.length,
                        separatorBuilder: (context, i) =>
                            const SizedBox(height: 1),
                        itemBuilder: (context, i) => Text(
                          "${Globle.cartShopping[i]['productName']}",
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: Globle.cartShopping.length,
                        separatorBuilder: (context, i) =>
                            const SizedBox(height: 1),
                        itemBuilder: (context, i) => Text(
                          textAlign: TextAlign.justify,
                          "${Globle.cartShopping[i]['count']}",
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: Globle.cartShopping.length,
                        separatorBuilder: (context, i) =>
                            const SizedBox(height: 1),
                        itemBuilder: (context, i) => Text(
                          textAlign: TextAlign.justify,
                          "${Globle.cartShopping[i]['price']}",
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: Globle.cartShopping.length,
                        separatorBuilder: (context, i) =>
                            const SizedBox(height: 1),
                        itemBuilder: (context, i) => Text(
                          textAlign: TextAlign.justify,
                          "${Globle.cartShopping[i]['total']}",
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 20,
                ),
                Row(
                  children: [
                    const Spacer(),
                    const Text(
                      "Total Amount :",
                    ),
                    Text(
                      " ${Globle.sum}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Text(
            "* If You Want To Save/Print Your Pdf",
            style: GoogleFonts.ptSerif(
              fontSize: 18,
              color: Colors.red,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Press  -->",
                style: GoogleFonts.ptSerif(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.print,
                  size: 30,
                ),
                onPressed: () async {
                  try {
                    await Printing.layoutPdf(onLayout: (format) => pdf.save());
                  } catch (e) {
                    print("=======================");
                    print("$e");
                    print("=======================");
                  }
                },
              ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(241, 232, 232, 243),
    );
  }
}
