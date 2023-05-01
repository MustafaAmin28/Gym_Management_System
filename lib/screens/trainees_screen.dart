import 'package:flutter/material.dart';
import '../components/person_card.dart';
import '../constants.dart';
import '../models/trainee_model.dart';
import 'trainee_profile_screen.dart';

// ignore: must_be_immutable
class TraineesScreen extends StatefulWidget {
  TraineesScreen({super.key, required this.trainees});
  List trainees = [];
  @override
  State<TraineesScreen> createState() => _TraineesScreenState();
}

class _TraineesScreenState extends State<TraineesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            "Trainees & Trainers",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          leading: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.trainees.length,
                itemBuilder: (context, index) {
                  return PersonCard(
                    person: TraineeModel.traineesFromMap(widget.trainees[index]),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return TraineeProfileScreen(trainee: TraineeModel.traineesFromMap(widget.trainees[index]));
                      }));
                    },
                    height: 130,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
