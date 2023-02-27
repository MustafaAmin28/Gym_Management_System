import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:qr_flutter/qr_flutter.dart';
import '../components/custom_list_tile.dart';
import '../models/person_model.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({required this.person});

  PersonModel person;

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
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 72,
                  backgroundImage: AssetImage(person.image),
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
                    data: '${person.id}',
                    size: 150,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomListTile(
                leading: const Icon(Icons.person),
                title: person.name,
                border: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                leading: const Icon(FontAwesomeIcons.idCard),
                title: '${person.id}',
                border: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                leading: const Icon(FontAwesomeIcons.calendar),
                title: '${person.age} Years',
                border: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                leading: const Icon(FontAwesomeIcons.mobile),
                title: person.phone,
                border: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                leading: const Icon(FontAwesomeIcons.envelope),
                title: person.email,
                border: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                leading: const Icon(FontAwesomeIcons.weightScale),
                title: '${person.weight} Kg',
                border: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                leading: const Icon(Icons.height),
                title: '${person.height} Cm',
                border: true,
              ),
            ],
          ),
        ))
      ],
    ));
  }
}
