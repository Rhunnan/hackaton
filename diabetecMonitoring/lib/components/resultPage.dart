import 'package:diabetec_monitoring/components/my_home_page.dart';
import 'package:flutter/material.dart';

class resultPage extends StatefulWidget {
  const resultPage({super.key});

  @override
  State<resultPage> createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate a delay of 3 seconds
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false; // Set loading to false after the delay
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: SizedBox(
                  height: 100, width: 100, child: CircularProgressIndicator()))
          : Column(
              children: [
                //profilepict part notif and name
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, right: 15),
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
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
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
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20.0),
                  child: Container(
                    height: 115,
                    width: 366,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/resultName.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    height: 173,
                    width: 366,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/BSLresult.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    height: 161,
                    width: 366,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/height-weight-result.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    height: 141,
                    width: 366,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/bmi-result.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    height: 48,
                    width: 366,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/burnedcal.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                //navigation Bar part
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()),
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
                )
              ],
            ),
    );
  }
}
