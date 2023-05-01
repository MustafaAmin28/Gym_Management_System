import 'package:flutter/material.dart';
import 'package:gym_graduation_app/components/custom_inkwell.dart';
import 'package:gym_graduation_app/screens/class_screen.dart';
import '../constants.dart';
import '../main.dart';
import '../models/exercise_model.dart';
import 'specific_body_part_exercises.dart';

// ignore: must_be_immutable
class ExercisesScreen extends StatelessWidget {
  ExercisesScreen({super.key, required this.exerciseTypes});
  List exerciseTypes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Exercises",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: exerciseTypes.length,
        itemBuilder: ((context, index) {
          return CustomInkWell(
              height: 140,
              image: exerciseTypes[index]["image"],
              title: exerciseTypes[index]["title"],
              onTap: () async {
                List<ExerciseModel> exerciseList = [];
                await ClassScreen.getexercise(bodyPartName: exerciseTypes[index]["bodyPartName"], exerciseList: exerciseList);
                Navigator.push(navigatorKey.currentState!.context, MaterialPageRoute(builder: (context) {
                  return SpecificBodyPartExercisesScreen(
                    exerciseList: exerciseList,
                  );
                }));
              });
        }),
      ),
    );
  }
}
