import 'package:flutter/material.dart';
import 'package:gym_graduation_app/models/exercise_model.dart';
import '../components/exercise_card.dart';
import '../constants.dart';

// ignore: must_be_immutable
class SpecificBodyPartExercisesScreen extends StatelessWidget {
  SpecificBodyPartExercisesScreen({super.key, required this.exerciseList});

  List<ExerciseModel> exerciseList = [];
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
        itemCount: exerciseList.length,
        itemBuilder: ((context, index) {
          return ExerciseCard(
            exercise: exerciseList[index],
          );
        }),
      ),
    );
  }
}
