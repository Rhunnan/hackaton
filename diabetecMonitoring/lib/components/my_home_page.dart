import 'package:diabetec_monitoring/components/monitor_health_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        //App Name
        Container(
          height: 61,
          width: 281,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.cover)),
        ),
        //services buttons part
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MonitorHealthPage()),
            );
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Container(
                height: 173,
                width: 375,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/MONITORHEALTHBUTTON.png"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 10),
              child: Container(
                height: 173,
                width: 355,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/diabetic-retinopathy-button.png"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 20),
              child: Container(
                height: 180,
                width: 375,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/doctor-button.png"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: 70,
              width: 342,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/slidetoconnect.png"),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        //navigation Bar part
        Container(
          height: 44,
          width: 169,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/navbar.png"),
                  fit: BoxFit.cover)),
        )
      ],
    ));
  }
}
