import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/constants.dart';
import 'package:gym_graduation_app/models/trainer_model.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../components/custom_list_tile.dart';

// ignore: must_be_immutable
class TrainerProfileScreen extends StatelessWidget {
  TrainerProfileScreen({super.key, required this.trainer});

  TrainerModel trainer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFFB5B21),
                    Colors.orange.shade700,
                    Colors.orange.shade300,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(150), bottomRight: Radius.circular(150)),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 80,
              child: CircleAvatar(
                radius: 75,
                backgroundColor: kPrimaryColor,
                child: CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  radius: 72,
                  backgroundImage:
                      trainer.photo == null ? const AssetImage(kPersonAvatar) : CachedNetworkImageProvider(trainer.photo!, errorListener: () => const AssetImage(kFailedNetworkImage)) as ImageProvider,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QrImage(
                    data: trainer.id,
                    size: 150,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomListTile(
                leading: Icons.person,
                title: trainer.name,
                border: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                leading: FontAwesomeIcons.envelope,
                title: trainer.email,
                border: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                leading: FontAwesomeIcons.calendarDays,
                title: "${trainer.age} years",
                border: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                leading: FontAwesomeIcons.phone,
                title: trainer.phone,
                border: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                leading: FontAwesomeIcons.star,
                title: "${trainer.experience} experience",
                border: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                leading: FontAwesomeIcons.book,
                title: trainer.biography,
                border: true,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Skills:",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: trainer.skills.length,
                        itemBuilder: ((context, index) {
                          return Text(
                            "- ${trainer.skills[index]}",
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          );
                        })),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ))
      ],
    ));
  }
}
