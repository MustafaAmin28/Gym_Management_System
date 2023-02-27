import 'package:flutter/material.dart';
import '../components/person_card.dart';
import '../constants.dart';
import '../models/trainer_model.dart';
import '../services/users.dart';
import 'profile_screen.dart';

class TrainersScreen extends StatelessWidget {
  TrainersScreen({super.key, required this.className});
  final String className;

  List trainers = [];

  @override
  Widget build(BuildContext context) {
    getTrainers();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Trainers",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: trainers.length,
          itemBuilder: (context, index) {
            return PersonCard(
              height: 140,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfileScreen(
                    person: TrainerModel.fromMap(trainers[index]),
                  );
                }));
              },
              person: TrainerModel.fromMap(trainers[index]),
            );
          }),
    );
  }

  getTrainers() {
    for (int i = 0; i < Users.length; i++) {
      if (Users[i]['role'] == 'trainer') {
        trainers.add(Users[i]);
      }
    }
  }
}
