// ignore_for_file: camel_case_types, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, sort_child_properties_last

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'Globle.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: owner_page(),
    ),
  );
}

class owner_page extends StatefulWidget {
  @override
  State<owner_page> createState() => _owner_pageState();
}

class _owner_pageState extends State<owner_page> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> ownerLogin = GlobalKey<FormState>();

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
      body: Form(
        key: ownerLogin,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Owner Login.",
                style: GoogleFonts.ptSerif(
                  fontSize: 30,
                  color: Colors.teal,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListView(
              shrinkWrap: true,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          maxRadius: 60,
                          backgroundColor: Colors.grey,
                          backgroundImage: (Globle.galleryFile != null)
                              ? FileImage(Globle.galleryFile!)
                              : null,
                          child: (Globle.galleryFile == null)
                              ? Text(
                                  "ADD\nLOGO",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 22,
                                    color: Colors.black,
                                  ),
                                )
                              : null,
                        ),
                      ],
                    ),
                    Positioned(
                      left: 210,
                      top: 85,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: FloatingActionButton(
                          child: const Icon(
                            Icons.add,
                            size: 20,
                          ),
                          elevation: 0,
                          mini: true,
                          backgroundColor: Colors.teal,
                          onPressed: () async {
                            XFile? gallery = await image.pickImage(
                              source: ImageSource.gallery,
                            );
                            Globle.memoryImage = await gallery!.readAsBytes();

                            setState(() {
                              Globle.galleryFile = File(gallery.path);
                            });
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      left: 250,
                      top: 75,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                          color: Colors.teal,
                        ),
                        onPressed: () {
                          setState(() {
                            Globle.galleryFile = null;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                (Globle.stopOwnerLogin)
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
                              controller: nameController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter Name";
                                }
                                return null;
                              },
                              cursorColor: Colors.teal,
                              cursorHeight: 25,
                              cursorWidth: 2,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal, width: 1)),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.teal, width: 2.5),
                                ),
                                hintText: "Enter Name",
                                hintStyle: Globle.hintText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter Password";
                                } else if (val != password) {
                                  return "Enter Valid Password";
                                }
                                return null;
                              },
                              cursorColor: Colors.teal,
                              cursorHeight: 25,
                              cursorWidth: 2,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal, width: 1)),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.teal, width: 2.5),
                                ),
                                hintText: "Enter Password",
                                hintStyle: Globle.hintText,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  child: Text(
                    "Log In",
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
                    if (ownerLogin.currentState!.validate()) {
                      Globle.stopOwnerLogin = false;
                      Navigator.of(context)
                          .pushNamed("ownerDetailShowing_page");
                    }
                  },
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(241, 232, 232, 243),
    );
  }
}
