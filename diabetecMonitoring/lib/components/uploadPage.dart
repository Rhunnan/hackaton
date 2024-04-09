import 'dart:io';

import 'package:diabetec_monitoring/components/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final picker = ImagePicker();
  late Future<PickedFile?> pickedFile;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    pickedFile = Future.value(null);
    // Simulate a delay of 3 seconds
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false; // Set loading to false after the delay
      });
    });
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        this.pickedFile = Future.value(pickedFile);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //profilepict part notif and name
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 15),
                child: Container(
                  height: 54,
                  width: 54,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/profile.png",
                          ),
                          fit: BoxFit.contain)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 170, top: 20),
                child: Text(
                  "John Doe",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: Container(
                  height: 44,
                  width: 42,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/notif-button.png",
                          ),
                          fit: BoxFit.contain)),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 720,
            width: 300,
            child: FutureBuilder<PickedFile?>(
              future: pickedFile,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Loading indicator
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData && snapshot.data != null) {
                  return isLoading
                      ? const CircularProgressIndicator()
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child:
                              //diri ang pag show sa uploaded image
                              Column(
                            children: [
                              Container(
                                height: 60,
                                width: 120,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/resultsLetter.png"))),
                              ),
                              SizedBox(
                                height: 263,
                                width: 263,
                                // child: Image.network(
                                //   snapshot.data!.path,
                                //   height: 263,
                                //   width: 263,
                                // ),
                                child: Image.file(
                                  File(snapshot.data!.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 15.0, bottom: 25),
                                child: SizedBox(
                                  height: 40,
                                  width: 368,
                                  child: Text(
                                    "Probability of a\ndeveloping Diabetic Retinopathy:",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 33,
                                width: 368,
                                child: Text(
                                  "Positive 88%",
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xfff4c3c2)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 50, bottom: 40),
                                child: Container(
                                  height: 33,
                                  width: 281,
                                  decoration: BoxDecoration(
                                      color: const Color(0xfff4c3c2),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                              const SizedBox(
                                height: 33,
                                width: 368,
                                child: Text(
                                  "Negative 88%",
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xffE88EED)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 150, bottom: 60),
                                child: Container(
                                  height: 33,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffE88EED),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                height: 84,
                                width: 369,
                                decoration: BoxDecoration(
                                    color: const Color(0xfff4c3c2),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Center(
                                  child: Text(
                                    "The image has shown concerning symptoms of Diabetic Retinopathy.",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 20.0),
                        child: Container(
                          height: 100,
                          width: 350,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/checkfor.png"))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, bottom: 30.0),
                        child: InkWell(
                          onTap: _pickImageFromGallery,
                          child: Container(
                            height: 79,
                            width: 366,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/upload image.png"))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100.0),
                        child: Container(
                          height: 161,
                          width: 366,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/open image.png"))),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),

          Padding(
              padding: const EdgeInsets.only(top: 30),
              child: //navigation Bar part
                  GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
                child: Container(
                  height: 44,
                  width: 169,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/navbar.png"),
                          fit: BoxFit.cover)),
                ),
              ))
        ],
      ),
    );
  }
}
