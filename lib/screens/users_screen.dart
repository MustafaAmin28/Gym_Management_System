import 'package:flutter/material.dart';
import '../components/person_card.dart';
import '../constants.dart';
import '../models/trainee_model.dart';
import 'trainee_profile_screen.dart';

// ignore: must_be_immutable
class UsersScreen extends StatefulWidget {
  UsersScreen({super.key, required this.users});
  List users = [];
  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            "Users",
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
                itemCount: widget.users.length,
                itemBuilder: (context, index) {
                  return PersonCard(
                    person: TraineeModel.traineesFromMap(widget.users[index]),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return TraineeProfileScreen(trainee: TraineeModel.traineesFromMap(widget.users[index]));
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
