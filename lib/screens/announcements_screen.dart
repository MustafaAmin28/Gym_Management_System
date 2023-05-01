import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/components/custom_list_tile_v2.dart';
import 'package:gym_graduation_app/constants.dart';
import 'package:gym_graduation_app/models/announcement_model.dart';

// ignore: must_be_immutable
class AnnouncementsScreen extends StatelessWidget {
  AnnouncementsScreen({super.key});
  CollectionReference announcements = FirebaseFirestore.instance.collection('announcements');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: announcements.orderBy('date', descending: true).snapshots(),
        builder: (context, snapshot) {
          List<AnnouncementModel> announcmentsList = [];
          if (snapshot.data != null) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              announcmentsList.add(AnnouncementModel.fromJson(snapshot.data!.docs[i]));
            }
          }
          return Scaffold(
            backgroundColor: kBackgroundColor,
            body: ListView.builder(
                itemCount: announcmentsList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomListTile(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.grey.shade800,
                    leading: const Icon(
                      FontAwesomeIcons.solidBell,
                      color: kPrimaryColor,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        announcmentsList[index].announcement,
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    subtitle: Text(
                        "${announcmentsList[index].date.toDate().day}-${announcmentsList[index].date.toDate().month}-${announcmentsList[index].date.toDate().year}, ${announcmentsList[index].date.toDate().hour}:${announcmentsList[index].date.toDate().toLocal().minute}",
                        style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 10)),
                  );
                }),
          );
        });
  }
}
