import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/person_model.dart';

class PersonCard extends StatelessWidget {
  PersonCard({super.key, required this.person, this.height = 200, required this.onTap, this.selectedProfileImage});
  PersonModel person;
  double? height;
  Uint8List? selectedProfileImage;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        margin: const EdgeInsets.all(8),
        color: Colors.grey.shade800,
        child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(person.image),
                ),
                const VerticalDivider(
                  thickness: 2,
                  color: Colors.grey,
                  indent: 6,
                  endIndent: 6,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          person.name,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Age: ${person.age}',
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                )
              ]),
            )),
      ),
    );
  }
}
