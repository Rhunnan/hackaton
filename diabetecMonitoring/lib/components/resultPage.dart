import 'package:flutter/material.dart';

class resultPage extends StatefulWidget {
  const resultPage({super.key});

  @override
  State<resultPage> createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
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
                      image:
                          AssetImage("assets/images/height-weight-result.png"),
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
          Container(
            height: 44,
            width: 169,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/navbar.png"),
                    fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}
