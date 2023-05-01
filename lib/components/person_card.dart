import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:gym_graduation_app/constants.dart';
import '../models/person_model.dart';
import '../screens/full_screen_file.dart';

// ignore: must_be_immutable
class PersonCard extends StatelessWidget {
  PersonCard({super.key, required this.person, this.height = 100, required this.onTap, this.selectedProfileImage});
  PersonModel person;
  double? height;
  Uint8List? selectedProfileImage;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(8),
        color: Colors.grey.shade800,
        child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(children: [
                GestureDetector(
                  onTap: () => Navigator.push(context, FullScreenImage(imageUrl: person.photo)),
                  child: CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    radius: 35,
                    backgroundImage: person.photo == null
                        ? const AssetImage(kPersonAvatar)
                        : CachedNetworkImageProvider(scale: 0.5, person.photo!, errorListener: () => AssetImage(kFailedNetworkImage)) as ImageProvider,
                  ),
                ),
                const VerticalDivider(
                  thickness: 1,
                  color: Colors.grey,
                  indent: 6,
                  endIndent: 6,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        person.name,
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
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
