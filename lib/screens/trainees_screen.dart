import 'package:flutter/material.dart';

import '../components/custom_elevated_button.dart';
import '../components/person_card.dart';
import '../constants.dart';
import '../models/trainee_model.dart';
import '../services/users.dart';
import 'add_trainee_screen.dart';
import 'profile_screen.dart';

class TraineesScreen extends StatefulWidget {
  const TraineesScreen({super.key});

  static String id = 'Trainees Screen';

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
            "Trainees",
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
                itemCount: Users.length,
                itemBuilder: (context, index) {
                  return PersonCard(
                    person: TraineeModel.fromMap(Users[index]),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProfileScreen(
                            person: TraineeModel.fromMap(Users[index]));
                      }));
                    },
                    height: 130,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: CustomElevatedButton(
                buttonText: 'Add New Trainee',
                height: 60,
                width: 230,
                buttonColor: kPrimaryColor,
                onTap: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return AddTraineeScreen();
                  })).then((value) => setState(() {}));
                },
              ),
            ),
          ],
        ));
  }
}
