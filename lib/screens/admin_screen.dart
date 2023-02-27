import 'package:flutter/material.dart';
import '../components/custom_inkwell.dart';
import '../constants.dart';
import 'check_user_screen.dart';
import 'trainees_screen.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({required this.adminUsername});
  String adminUsername;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Admin Panel",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        leading: const Icon(
          Icons.admin_panel_settings,
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          CustomInkWell(
              image: 'assets/images/Trainees_background.jpg',
              title: 'Trainees',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TraineesScreen();
                }));
              },
              textBackgroundColor: Colors.black.withOpacity(0.5)),
          CustomInkWell(
              image: 'assets/images/QR_Scan_Background.jpg',
              title: 'Check User',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CheckUserScreen();
                }));
              },
              textBackgroundColor: Colors.black.withOpacity(0.5)),
        ],
      ),
    );
  }
}
