import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../components/custom_elevated_button.dart';
import '../constants.dart';

class BmrScreen extends StatefulWidget {
  const BmrScreen({Key? key}) : super(key: key);
  static String id = "BmrScreen";

  @override
  State<BmrScreen> createState() => _BmrScreenState();
}

class _BmrScreenState extends State<BmrScreen> {
  Gender? selectedGender;
  int height = 100, weight = 50, age = 18, descriptionIndex = 1, bmr = 2000;

  double activityFactor = 1.2;
  List<String> activityFactorDescription = [
    "Idle (Ex: Office worker, No Exercises)",
    "Low (One to 3 days of Exercises weekly)",
    "Medium (5 to 6 days of Exercises weekly)",
    "High (one or two Exercises everyday)",
  ];
  int _radioSelectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Calculators"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Your Goal:",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 20,
                ),
                Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => kPrimaryColor),
                    value: 1,
                    groupValue: _radioSelectedValue,
                    onChanged: (value) {
                      if (_radioSelectedValue != 1) {
                        setState(() {
                          _radioSelectedValue = 1;
                        });
                      }
                    }),
                const Text(
                  "Gain Weight",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 20,
                ),
                Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => kPrimaryColor),
                    value: 2,
                    groupValue: _radioSelectedValue,
                    onChanged: (value) {
                      if (_radioSelectedValue != 2) {
                        setState(() {
                          _radioSelectedValue = 2;
                        });
                      }
                    }),
                const Text(
                  "Lose Weight",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: Container(
                    height: 130,
                    width: 170,
                    decoration: BoxDecoration(
                      color: selectedGender == Gender.male
                          ? Colors.grey.shade700
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          (Icons.man),
                          size: 80,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Male',
                          style: TextStyle(fontSize: 22),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: Container(
                    height: 130,
                    width: 170,
                    decoration: BoxDecoration(
                      color: selectedGender == Gender.female
                          ? Colors.grey.shade700
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          (Icons.girl),
                          size: 80,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Female',
                          style: TextStyle(fontSize: 22),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 14),
                    child: Text(
                      "Height",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$height",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.white),
                      ),
                      const Text(
                        " cm",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xff8d8e98),
                        thumbColor: kPrimaryColor,
                        overlayColor: const Color(0x29eb1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 60.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 155,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          "Weight",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$weight',
                            style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Text(
                            ' Kg',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (weight > 20) {
                                setState(() {
                                  weight--;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              backgroundColor:
                                  Colors.grey.shade400, // <-- Button color
                              // <-- Splash color
                            ),
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              size: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              backgroundColor:
                                  Colors.grey.shade400, // <-- Button color
                              // <-- Splash color
                            ),
                            child: const Icon(
                              FontAwesomeIcons.plus,
                              size: 15,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Container(
                  height: 155,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          "Age",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$age',
                            style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Text(
                            ' Years',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (age > 10) {
                                setState(() {
                                  age--;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              backgroundColor:
                                  Colors.grey.shade400, // <-- Button color
                              // <-- Splash color
                            ),
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              size: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              backgroundColor:
                                  Colors.grey.shade400, // <-- Button color
                              // <-- Splash color
                            ),
                            child: const Icon(
                              FontAwesomeIcons.plus,
                              size: 15,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  "Activity factor:",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                RatingBar.builder(
                  initialRating: 1,
                  minRating: 1,
                  itemCount: 4,
                  unratedColor: Colors.grey,
                  itemPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  itemBuilder: (context, _) => const Icon(
                    Icons.circle,
                    color: kPrimaryColor,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      switch (rating.toString()) {
                        case "1.0":
                          activityFactor = 1.2;
                          descriptionIndex = 0;
                          break;
                        case "2.0":
                          activityFactor = 1.3;
                          descriptionIndex = 1;
                          break;
                        case "3.0":
                          activityFactor = 1.5;
                          descriptionIndex = 2;
                          break;
                        case "4.0":
                          activityFactor = 1.7;
                          descriptionIndex = 3;
                          break;
                        default:
                          activityFactor = 1.2;
                          descriptionIndex = 4;
                          break;
                      }
                    });
                  },
                )
              ],
            ),
            Text(
              activityFactorDescription[descriptionIndex],
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomElevatedButton(
                buttonText: "Calculate",
                height: 40,
                width: double.infinity,
                buttonColor: kPrimaryColor,
                onTap: () {
                  bmrCalculate();
                  showResultDialog(context);
                })
          ],
        ),
      ),
    );
  }

  void bmrCalculate() {
    if (selectedGender == Gender.male) {
      bmr = (((10 * weight) + (6.25 * height) - (5 * age) + 5) * activityFactor)
          .round();
    } else if (selectedGender == Gender.female) {
      bmr =
          (((10 * weight) + (6.25 * height) - (5 * age) - 161) * activityFactor)
              .round();
    } else {
      bmr = 0;
    }
  }

  void showResultDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        backgroundColor: kBackgroundColor,
        title: Center(
          child: bmr == 0
              ? const Text("Error", style: TextStyle(color: Colors.white))
              : const Text("Result", style: TextStyle(color: Colors.white)),
        ),
        children: bmr == 0
            ? [
                const SizedBox(
                  height: 15,
                ),
                const Text("Please choose your gender.",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ]
            : [
                const SizedBox(
                  height: 15,
                ),
                Text("You need $bmr Calories to maintain your current weight.",
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                _radioSelectedValue == 1
                    ? Text(
                        "You need ${(bmr * 1.12).round()} Calories for Mild weight gain (0.25 kg/week).",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16))
                    : Text(
                        "You need ${(bmr * 0.88).round()} Calories for Mild weight loss (0.25 kg/week).",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                _radioSelectedValue == 1
                    ? Text(
                        "You need ${(bmr * 1.24).round()} Calories for Average weight gain (0.5 kg/week).",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16))
                    : Text(
                        "You need ${(bmr * 0.76).round()} Calories for Average weight loss (0.5 kg/week).",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                _radioSelectedValue == 1
                    ? Text(
                        "You need ${(bmr * 1.48).round()} Calories for Fast weight gain (1 kg/week).",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16))
                    : Text(
                        "You need ${(bmr * 0.52).round()} Calories for Extreme weight loss (1 kg/week).",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Okay",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)))
                  ],
                )
              ],
      ),
    );
  }
}

enum Gender { male, female }
