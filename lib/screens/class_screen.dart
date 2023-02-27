import 'package:flutter/material.dart';
import 'package:gym_graduation_app/components/custom_exercise_inkwell.dart';
import '../components/custom_inkwell.dart';
import '../constants.dart';
import '../main.dart';
import 'exercises_screen.dart';
import 'pricing_plans_screen.dart';
import 'trainers_screen.dart';

class ClassScreen extends StatelessWidget {
  const ClassScreen({super.key, required this.className});
  final String className;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          className,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: Column(
        children: choosenClass(),
      ),
    );
  }

  List<Widget> choosenClass() {
    if (className == "Warm Up") {
      return <Widget>[
        CustomExerciseInkWell(
          height: 200,
          image: 'assets/images/Classes pics/upper part background.jpg',
          title: 'Upper Body',
          textBackgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
        ),
        CustomExerciseInkWell(
          height: 200,
          image: 'assets/images/Classes pics/lower part background.jpg',
          title: 'Lower Body',
          textBackgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
        ),
      ];
    } else if (className == "Body Building") {
      return <Widget>[
        CustomInkWell(
          height: 200,
          image: 'assets/images/pricing_plans_background.jpg',
          title: 'Pricing',
          onTap: () {
            navigatorKey.currentState!.push(MaterialPageRoute(
                builder: (context) => PricingScreen(
                      className: className,
                    )));
          },
          textBackgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
        ),
        CustomInkWell(
          height: 200,
          image: 'assets/images/Exercises_background.jpg',
          title: 'Exercises',
          onTap: () {
            navigatorKey.currentState!.push(MaterialPageRoute(
                builder: (context) => ExercisesScreen(
                      className: className,
                    )));
          },
          textBackgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
        ),
        CustomInkWell(
          height: 200,
          image: 'assets/images/Trainer background.jpg',
          title: 'Trainers',
          onTap: () {
            navigatorKey.currentState!.push(MaterialPageRoute(
                builder: (context) => TrainersScreen(
                      className: className,
                    )));
          },
          textBackgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
        ),
      ];
    } else {
      return <Widget>[const Text("data")];
    }
  }
}
