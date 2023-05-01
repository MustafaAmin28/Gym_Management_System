import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/custom_inkwell.dart';
import '../constants.dart';
import '../helper/api.dart';
import '../main.dart';
import '../models/exercise_model.dart';
import 'exercises_screen.dart';
import 'pricing_plans_screen.dart';
import 'specific_body_part_exercises.dart';
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
        SizedBox(
          height: 5,
        ),
        CustomInkWell(
            height: 140,
            image: 'assets/images/Classes pics/upper part background.jpg',
            title: 'Upper Body',
            onTap: () async {
              List<ExerciseModel> exerciseList = [];
              await getexercise(bodyPartName: "warm_up_upper", exerciseList: exerciseList);
              Navigator.push(navigatorKey.currentState!.context, MaterialPageRoute(builder: (context) {
                return SpecificBodyPartExercisesScreen(
                  exerciseList: exerciseList,
                );
              }));
            }),
        CustomInkWell(
            height: 140,
            image: 'assets/images/Classes pics/lower part background.jpg',
            title: 'Lower Body',
            onTap: () async {
              List<ExerciseModel> exerciseList = [];
              await getexercise(bodyPartName: "warm_up_lower", exerciseList: exerciseList);

              Navigator.push(navigatorKey.currentState!.context, MaterialPageRoute(builder: (context) {
                return SpecificBodyPartExercisesScreen(
                  exerciseList: exerciseList,
                );
              }));
            }),
      ];
    } else if (className == "Body Building") {
      return <Widget>[
        // CustomInkWell(
        //   height: 140,
        //   image: 'assets/images/pricing_plans_background.jpg',
        //   title: 'Pricing',
        //   onTap: () {
        //     navigatorKey.currentState!.push(MaterialPageRoute(
        //         builder: (context) => PricingScreen(
        //               className: className,
        //             )));
        //   },
        //   textBackgroundColor: Colors.black.withOpacity(0.5),
        //   textColor: Colors.white,
        // ),
        SizedBox(
          height: 5,
        ),
        CustomInkWell(
          height: 140,
          image: 'assets/images/Exercises_background.jpg',
          title: 'Exercises',
          onTap: () {
            List exerciseList = [
              {'bodyPartName': 'chest', 'title': "Chest", "image": 'assets/Exercises/chest_background.jpg'},
              {'bodyPartName': 'back', 'title': "Back", "image": 'assets/Exercises/back_background.jpg'},
              {'bodyPartName': 'shoulders', 'title': "Shoulders", "image": 'assets/Exercises/shoulders_background.jpeg'},
              {'bodyPartName': 'arm', 'title': "Arm", "image": 'assets/Exercises/arm_background.jpg'},
              {'bodyPartName': 'legs', 'title': "Legs", "image": 'assets/Exercises/legs_background.jpg'}
            ];

            navigatorKey.currentState!.push(MaterialPageRoute(
                builder: (context) => ExercisesScreen(
                      exerciseTypes: exerciseList,
                    )));
          },
          textBackgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
        ),
        CustomInkWell(
          height: 140,
          image: 'assets/images/Trainer background.jpg',
          title: 'Trainers',
          onTap: () async {
            List trainersList = [];
            await getTrainers(trainers: trainersList);

            navigatorKey.currentState!.push(MaterialPageRoute(
                builder: (context) => TrainersScreen(
                      trainers: trainersList,
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

  getTrainers({required List trainers}) async {
    final response = await Api.getTrainer();
    if (response["status"] == "success") {
      for (int i = 0; i < response["length"]; i++) {
        trainers.add(response["trainers"][i]);
      }
    } else {
      Fluttertoast.showToast(msg: response["message"]);
    }
  }

  static getexercise({required String bodyPartName, required List exerciseList}) async {
    final exerciseResponse = await Api.getExercises(type: bodyPartName);
    if (exerciseResponse["status"] == "success") {
      for (int i = 0; i < exerciseResponse["length"]; i++) {
        exerciseList.add(ExerciseModel.fromMap(exerciseResponse["exercises"][i]));
      }
    } else {
      Fluttertoast.showToast(msg: exerciseResponse["message"]);
    }
  }
}
