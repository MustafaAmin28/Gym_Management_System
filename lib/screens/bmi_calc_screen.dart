import 'dart:math';
import 'package:flutter/material.dart';

import '../components/custom_elevated_button.dart';
import '../constants.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);
  static String id = "BmiScreen";

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int height = 100, weight = 50;
  double bmi = 0;
  String? bmiDescription;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
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
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),
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
                        overlayColor: Colors.orange,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 80.0,
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
                      "Weight",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$weight",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),
                      ),
                      const Text(
                        " kg",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xff8d8e98),
                        thumbColor: kPrimaryColor,
                        overlayColor: Colors.orange,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                        value: weight.toDouble(),
                        min: 20.0,
                        max: 180.0,
                        onChanged: (double newValue) {
                          setState(() {
                            weight = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(
              height: 25,
            ),
            CustomElevatedButton(
                buttonText: "Calculate",
                height: 40,
                width: double.infinity,
                buttonColor: kPrimaryColor,
                onTap: () {
                  calcBmi();
                  showResultDialog(context);
                })
          ],
        ),
      ),
    );
  }

  void calcBmi() {
    bmi = double.parse((weight / pow((height / 100), 2)).toStringAsFixed(2));
    if (bmi < 16) {
      bmiDescription = "Severe Thinness";
    } else if (bmi >= 16 && bmi < 17) {
      bmiDescription = "Moderate Thinness";
    } else if (bmi >= 17 && bmi < 18.5) {
      bmiDescription = "Mild Thinness";
    } else if (bmi >= 18.5 && bmi < 25) {
      bmiDescription = "Normal";
    } else if (bmi >= 25 && bmi < 30) {
      bmiDescription = "Overweight";
    } else if (bmi >= 30 && bmi < 35) {
      bmiDescription = "Obese Class I";
    } else if (bmi >= 35 && bmi < 40) {
      bmiDescription = "Obese Class II";
    } else {
      bmiDescription = "Obese Class III";
    }
  }

  void showResultDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          backgroundColor: kBackgroundColor,
          title: const Center(
            child: Text("Result", style: TextStyle(color: Colors.white)),
          ),
          children: [
            const SizedBox(
              height: 15,
            ),
            Text("Your bmi is $bmi", style: const TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(
              height: 15,
            ),
            Text("$bmiDescription", style: const TextStyle(color: Colors.white, fontSize: 16)),
          ]),
    );
  }
}

enum Gender { male, female }
