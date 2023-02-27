import 'package:flutter/material.dart';

import '../constants.dart';
import '../services/exercises.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key, required this.className});
  final String className;

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
        itemCount: exercisesTypes.length,
        itemBuilder: ((context, index) {
          return exercisesTypes[index];
        }),
      ),
    );
  }
}
