import 'package:flutter/material.dart';

class splashGvcPage extends StatefulWidget {
  const splashGvcPage({super.key});

  @override
  State<splashGvcPage> createState() => _splashGvState();
}

class _splashGvState extends State<splashGvcPage> {
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
              height: 100,
              width: 350,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/info component.png"))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: Container(
              height: 373,
              width: 366,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/splashinfoArt.png"))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              height: 161,
              width: 366,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/READY BUTTON.png"))),
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
