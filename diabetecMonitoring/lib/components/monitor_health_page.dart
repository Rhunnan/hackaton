import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MonitorHealthPage extends StatefulWidget {
  const MonitorHealthPage({super.key});

  @override
  State<MonitorHealthPage> createState() => _MonitorHealthPageState();
}

class _MonitorHealthPageState extends State<MonitorHealthPage> {
  List<String> caloriesList = [];
  bool isHypertensionYes = false;
  bool isHypertensionNo = false;
  bool isSmokingYes = false;
  bool isSmokingNo = false;
  bool maintainingInsulinYes = false;
  bool maintainginInsulinNo = false;
  double bmiResult = 0;
  TextEditingController systolicController = TextEditingController();
  TextEditingController diastolicController = TextEditingController();
  TextEditingController smokingYearsController = TextEditingController();
  TextEditingController weightTextController = TextEditingController();
  TextEditingController heightTextController = TextEditingController();
  TextEditingController caloriesTextController = TextEditingController();

  //for changing text buttons color
  MaterialStateProperty<Color> getColors(Color color, Color colorPressed) {
    return MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      }
      return color;
    });
  }

  //function to add calories
  void addToCaloriesList(String text) {
    caloriesList.add(text);
  }

  //function to calculate BMI
  double getBmi(TextEditingController weightController,
      TextEditingController heightController) {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    // Convert height from cm to meters
    height = height / 100.0;

    if (weight <= 0 || height <= 0) {
      return 0.0; // Return 0 if weight or height is not valid
    }

    return weight / (height * height);
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              //profile pict name and notif part
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
          //greeting Text
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 50, right: 30),
            child: Text(
              "Hello,\nHow are you feeling today?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: SizedBox(
              height: 585,
              width: 360,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  //questions
                  const Padding(
                    padding: EdgeInsets.only(right: 60, top: 50, bottom: 10),
                    child: Text(
                      "Do you have a history with Hypertension?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 37,
                      width: 368,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEFE5E5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHypertensionYes = true;
                                  isHypertensionNo = false;
                                });
                              },
                              child: Icon(
                                isHypertensionYes
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                            ),
                            const Text("Yes"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 37,
                      width: 368,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEFE5E5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHypertensionNo = true;
                                  isHypertensionYes = false;
                                });
                              },
                              child: Icon(
                                isHypertensionNo
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                            ),
                            const Text("No"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //show this if ishypertionYes is True this is the calendar part
                  isHypertensionYes
                      ? Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 100),
                              child:
                                  Text("When was the Hypertension diagnose?"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                height: 37,
                                width: 368,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xffEFE5E5),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.calendar_month),
                                      onPressed: () {
                                        _selectDate(context);
                                      },
                                    ),
                                    Text("${selectedDate.toLocal()}"
                                        .split(' ')[0]),
                                  ],
                                ),
                                //ibutang diri ang date nga widget
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 135),
                              child: Text("Highest Blood Pressure recorded?"),
                            ),
                            //uppper part sa blood pressure
                            const Padding(
                              padding: EdgeInsets.only(right: 295, top: 10.0),
                              child: Text("Systolic"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                height: 37,
                                width: 368,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xffEFE5E5),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: systolicController,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Input Numbers',
                                          hintStyle: TextStyle(fontSize: 14)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //lower part sa blood pressure
                            const Padding(
                              padding: EdgeInsets.only(right: 295, top: 10.0),
                              child: Text(
                                "Diastolic",
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                  height: 37,
                                  width: 368,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xffEFE5E5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: diastolicController,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Input Numbers',
                                          hintStyle: TextStyle(fontSize: 14)),
                                    ),
                                  )),
                            ),
                          ],
                        )
                      : //if ang hypertension is wala sya kasuway
                      Text(""),
                  //smoking question part question yes or no
                  Text("Do You Smoke ?"),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 37,
                      width: 368,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEFE5E5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSmokingYes = true;
                                  isSmokingNo = false;
                                });
                              },
                              child: Icon(
                                isSmokingYes
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                            ),
                            const Text("Yes"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 37,
                      width: 368,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEFE5E5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSmokingNo = true;
                                  isSmokingYes = false;
                                });
                              },
                              child: Icon(
                                isSmokingNo
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                            ),
                            const Text("No"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //here add howmany years textfield if is smoking is true
                  isSmokingYes
                      ? Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 20,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(right: 220),
                                child: Text("For how many years?"),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                height: 37,
                                width: 368,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xffEFE5E5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: smokingYearsController,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Input Numbers',
                                        hintStyle: TextStyle(fontSize: 15)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Text(""),
                  //for weight in kilograms
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 230),
                          child: Text("Weight (Kilograms)?"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 37,
                          width: 368,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffEFE5E5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: weightTextController,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Input Numbers',
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //for height
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 220),
                          child: Text("Height (Centimeters)?"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 37,
                          width: 368,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffEFE5E5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: heightTextController,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Input Numbers',
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //for BMI
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 320),
                          child: Text("BMI"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 37,
                          width: 368,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffEFE5E5),
                          ),
                          child: Row(
                            children: [
                              bmiResult == 0
                                  ? const SizedBox(
                                      height: 30, width: 200, child: Text(""))
                                  : SizedBox(
                                      height: 30,
                                      width: 200,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          bmiResult.toStringAsFixed(2),
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      )),
                              SizedBox(
                                height: 30,
                                width: 150,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor: getColors(
                                            Colors.white, Color(0xfff4c3c2)),
                                        backgroundColor: getColors(
                                            Color(0xfff4c3c2), Colors.white)),
                                    onPressed: () {
                                      if (heightTextController
                                              .text.isNotEmpty &&
                                          weightTextController
                                              .text.isNotEmpty) {
                                        return setState(() {
                                          bmiResult = getBmi(
                                              weightTextController,
                                              heightTextController);
                                        });
                                      }
                                    },
                                    child: const Text("Calculate BMI")),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  //for Calories intake textfield
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 180),
                          child: Text("Calories Intake For Today:"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 37,
                          width: 368,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffEFE5E5),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 30,
                                width: 250,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: caloriesTextController,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Input Numbers',
                                        hintStyle: TextStyle(fontSize: 15)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                width: 100,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor: getColors(
                                            Colors.white, Color(0xfff4c3c2)),
                                        backgroundColor: getColors(
                                            Color(0xfff4c3c2), Colors.white)),
                                    onPressed: () {
                                      setState(() {
                                        addToCaloriesList(
                                            caloriesTextController.text);
                                      });
                                      caloriesTextController.clear();

                                      print(caloriesList);
                                    },
                                    child: const Text("Add")),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 50,
                      width: 368,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEFE5E5),
                      ),
                      child: caloriesList.isEmpty
                          ? const Text("")
                          : ListView.builder(
                              itemCount: caloriesList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    "${caloriesList[index]}kcal",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                );
                              },
                            )),
                  //mainting insulin question checkbox
                  const Padding(
                    padding: EdgeInsets.only(right: 60, top: 10, bottom: 10),
                    child: Text(
                      "Do you maintain insulin?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 37,
                      width: 368,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEFE5E5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  maintainingInsulinYes = true;
                                  maintainginInsulinNo = false;
                                });
                              },
                              child: Icon(
                                isHypertensionYes
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                            ),
                            const Text("Yes"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 37,
                      width: 368,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEFE5E5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  maintainginInsulinNo = true;
                                  maintainingInsulinYes = false;
                                });
                              },
                              child: Icon(
                                isHypertensionNo
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                            ),
                            const Text("No"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //submit button
                  Container(
                    height: 69,
                    width: 260,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/submit-button.png"))),
                  )
                ],
              ),
            ),
          ), //navigation Bar part
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
