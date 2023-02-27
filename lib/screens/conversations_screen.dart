import 'package:flutter/material.dart';
import 'package:gym_graduation_app/screens/login_screen.dart';

import '../components/person_card.dart';
import '../models/trainer_model.dart';
import '../services/users.dart';
import 'chat_screen.dart';

class ConversationsScreen extends StatelessWidget {
  ConversationsScreen({super.key});
  List<TrainerModel> myTrainers = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
          child: loginedUser.role == 'trainee'
              ? const Text(
                  'My Trainers:',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                )
              : const Text(
                  'My Trainees:',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: loginedUser.contractors.length,
          itemBuilder: ((context, index) {
            return PersonCard(
              height: 140,
              person: loginedUser.contractors[index],
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChatScreen(receiverParticipant: loginedUser.contractors[index]);
                }));
              },
            );
          }),
        ),
      ],
    );
  }
}
