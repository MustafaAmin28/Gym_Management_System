import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/components/custom_elevated_button.dart';
import 'package:gym_graduation_app/components/custom_text_field.dart';
import '../constants.dart';

class AddAnnouncementScreen extends StatefulWidget {
  const AddAnnouncementScreen({super.key});

  @override
  State<AddAnnouncementScreen> createState() => _AddAnnouncementScreenState();
}

class _AddAnnouncementScreenState extends State<AddAnnouncementScreen> {
  TextEditingController announcement = TextEditingController();
  CollectionReference announcements = FirebaseFirestore.instance.collection('announcements');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Add Announcement",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        leading: const Icon(
          FontAwesomeIcons.bullhorn,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            maxLines: null,
            hintText: "Announcement",
            labelText: "Write an Announcement",
            controller: announcement,
            fillColor: Colors.white.withOpacity(0.1),
            mainColor: kPrimaryColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: CustomElevatedButton(
                buttonText: "Add",
                height: 50,
                width: double.infinity,
                buttonColor: kPrimaryColor,
                onTap: () async {
                  if (announcement.text.isNotEmpty) {
                    Fluttertoast.showToast(msg: "Added");
                    addAnnouncment(announcement: announcement.text);
                    announcement.clear();
                  } else {
                    Fluttertoast.showToast(msg: "Field cannot be Empty!");
                  }
                }),
          )
        ],
      ),
    );
  }

  void addAnnouncment({required String announcement}) {
    try {
      announcements.add({'announcement': announcement, 'date': DateTime.now()});
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
