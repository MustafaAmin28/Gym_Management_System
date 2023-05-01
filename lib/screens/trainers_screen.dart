import 'package:flutter/material.dart';
import '../components/person_card.dart';
import '../constants.dart';
import '../models/trainer_model.dart';
import 'trainer_profile_screen.dart';

// ignore: must_be_immutable
class TrainersScreen extends StatefulWidget {
  TrainersScreen({super.key, required this.trainers});
  List trainers = [];
  @override
  State<TrainersScreen> createState() => _TrainersScreenState();
}

class _TrainersScreenState extends State<TrainersScreen> {
  @override
  Widget build(BuildContext context) {
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
          itemCount: widget.trainers.length,
          itemBuilder: (context, index) {
            return PersonCard(
              height: 100,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TrainerProfileScreen(
                    trainer: TrainerModel.trainersFromMap(widget.trainers[index]),
                  );
                }));
              },
              person: TrainerModel.trainersFromMap(widget.trainers[index]),
            );
          }),
    );
  }
}
