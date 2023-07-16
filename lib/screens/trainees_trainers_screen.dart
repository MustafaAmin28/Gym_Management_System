import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_graduation_app/components/custom_inkwell.dart';
import 'package:gym_graduation_app/screens/trainees_screen.dart';
import 'package:gym_graduation_app/screens/trainers_screen.dart';
import 'package:gym_graduation_app/screens/users_screen.dart';
import '../constants.dart';
import '../helper/api.dart';
import '../main.dart';

class TraineesAndTrainersAndUsersScreen extends StatelessWidget {
  const TraineesAndTrainersAndUsersScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "Traiees & Trainers",
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          CustomInkWell(
              title: "Trainees",
              image: 'assets/images/Trainees_background.jpg',
              onTap: () async {
                List traineesList = [];
                await getTrainees(trainees: traineesList);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TraineesScreen(
                    trainees: traineesList,
                  );
                }));
              }),
          CustomInkWell(
            title: "Trainers",
            image: 'assets/images/Trainer_vector_background.jpg',
            onTap: () async {
              List trainersList = [];
              await getTrainers(trainers: trainersList);

              navigatorKey.currentState!.push(MaterialPageRoute(
                  builder: (context) => TrainersScreen(
                        trainers: trainersList,
                      )));
            },
          ),
          CustomInkWell(
            title: "Users",
            image: 'assets/images/User_background.png',
            onTap: () async {
              List usersList = [];
              await getUsers(users: usersList);

              navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => UsersScreen(users: usersList)));
            },
          )
        ],
      ),
    );
  }

  getTrainees({required List trainees}) async {
    final response = await Api.getUser();
    if (response["status"] == "success") {
      for (int i = 0; i < response["length"]; i++) {
        if (response["data"]["users"][i]["role"] == "trainee") {
          trainees.add(response["data"]["users"][i]);
        }
      }
    } else {
      Fluttertoast.showToast(msg: response["message"]);
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

  getUsers({required List users}) async {
    final response = await Api.getUser();
    if (response["status"] == "success") {
      for (int i = 0; i < response["length"]; i++) {
        if (response["data"]["users"][i]["role"] == "user") {
          users.add(response["data"]["users"][i]);
        }
      }
    } else {
      Fluttertoast.showToast(msg: response["message"]);
    }
  }
}
