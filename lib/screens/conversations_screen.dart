import 'package:flutter/material.dart';
import 'package:gym_graduation_app/screens/login_screen.dart';
import '../components/person_card.dart';
import '../helper/api.dart';
import '../models/trainer_model.dart';
import 'chat_screen.dart';

class ConversationsScreen extends StatelessWidget {
  ConversationsScreen({super.key});
  final List<TrainerModel> myTrainers = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
          child: loggedUser!.role == 'trainer'
              ? const Text(
                  'My Trainees:',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                )
              : const Text(
                  'My Trainers:',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: loggedUser!.private.length,
          itemBuilder: ((context, index) {
            return PersonCard(
              height: 100,
              person: loggedUser!.private[index],
              onTap: () async {
                String deviceToken = await getTrainerToken(loggedUser!.private[index].email);
                print(deviceToken);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChatScreen(
                    receiverParticipant: loggedUser!.private[index],
                    deviceToken: deviceToken,
                  );
                }));
              },
            );
          }),
        ),
      ],
    );
  }

  Future<String> getTrainerToken(String email) async {
    final response = await Api.getDeviceToken(email: email);
    if (response["data"]["users"][0]["deviceToken"] != null)
      return response["data"]["users"][0]["deviceToken"];
    else
      return "no token yet";
  }
}
