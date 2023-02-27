import 'package:flutter/material.dart';

import '../components/exercise_card.dart';
import '../constants.dart';
import '../services/exercises.dart';

class SpecificBodyPartExercisesScreen extends StatelessWidget {
  const SpecificBodyPartExercisesScreen({super.key, required this.bodyPartName});
  final String bodyPartName;
  @override
  Widget build(BuildContext context) {
    List exerciseType() {
      if (bodyPartName == 'Chest') {
        return chestExercises;
      } else if (bodyPartName == 'Back') {
        return backExercises;
      } else if (bodyPartName == 'Shoulders') {
        return shouldersExercises;
      } else if (bodyPartName == 'Legs') {
        return legsExercises;
      } else if (bodyPartName == "Arm") {
        return armExercises;
      } else if (bodyPartName == 'Upper Body') {
        return upperPartExercises;
      } else if (bodyPartName == 'Lower Body') {
        return lowerPartExercises;
      } else {
        return [];
      }
    }

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
        itemCount: exerciseType().length,
        itemBuilder: ((context, index) {
          return ExerciseCard(
            thumbnailPath: exerciseType()[index].imgPath,
            exerciseTitle: exerciseType()[index].name,
            exerciseDescription: "Beginner",
            videoPath: exerciseType()[index].videoPath,
            steps: exerciseType()[index].steps,
          );
        }),
      ),
    );
  }
}
