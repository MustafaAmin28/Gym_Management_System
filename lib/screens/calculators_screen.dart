import 'package:flutter/material.dart';

import '../components/custom_inkwell.dart';
import '../constants.dart';
import 'bmi_calc_screen.dart';
import 'bmr_calc_screen.dart';

class CalculatorsScreen extends StatelessWidget {
  const CalculatorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Body Calculators",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomInkWell(
            height: 140,
            image: 'assets/images/bmi_background.jpg',
            title: 'BMI',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const BmiScreen();
              }));
            },
            textBackgroundColor: Colors.black.withOpacity(0.5),
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomInkWell(
            height: 140,
            image: 'assets/images/bmr_background.jpg',
            title: 'BMR',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const BmrScreen();
              }));
            },
            textBackgroundColor: Colors.black.withOpacity(0.5),
            textColor: Colors.white,
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
