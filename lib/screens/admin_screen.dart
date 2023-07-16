import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/screens/add_announcement_screen.dart';
import 'package:gym_graduation_app/screens/add_income_screen.dart';
import 'package:gym_graduation_app/screens/create_exercise_screen.dart';
import 'package:gym_graduation_app/screens/create_recipe_screen.dart';
import 'package:gym_graduation_app/screens/trainees_trainers_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/custom_inkwell.dart';
import '../constants.dart';
import 'login_screen.dart';
import 'qr_scanner_screen.dart';

// ignore: must_be_immutable
class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

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
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('admin');

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext ctx) => const LoginScreen()));
              },
              icon: Icon(FontAwesomeIcons.arrowRightFromBracket))
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 600,
            child: GridView(
              padding: const EdgeInsets.all(8),
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              children: [
                CustomInkWell(
                    width: 150,
                    height: 150,
                    image: 'assets/images/Trainees_background.jpg',
                    title: 'Trainees & Trainers',
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return TraineesAndTrainersAndUsersScreen();
                      }));
                    },
                    textBackgroundColor: Colors.black.withOpacity(0.5)),
                CustomInkWell(
                    width: 150,
                    height: 150,
                    image: 'assets/images/QR_Scan_Background.jpg',
                    title: 'Scan QR',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const QrScannerScreen();
                      }));
                    },
                    textBackgroundColor: Colors.black.withOpacity(0.5)),
                CustomInkWell(
                    width: 150,
                    height: 150,
                    image: 'assets/images/createExerciseBackground.png',
                    title: 'Create Exercise',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateExerciseScreen()));
                    },
                    textBackgroundColor: Colors.black.withOpacity(0.5)),
                CustomInkWell(
                    width: 150,
                    height: 150,
                    image: 'assets/images/createRecipeBackground.jpg',
                    title: 'Create Recipe',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateRecipeScreen()));
                    },
                    textBackgroundColor: Colors.black.withOpacity(0.5)),
                CustomInkWell(
                    width: 150,
                    height: 150,
                    image: 'assets/images/addIncomeBackground.jpg',
                    title: 'Add an Income',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AddIncomeScreen()));
                    },
                    textBackgroundColor: Colors.black.withOpacity(0.5)),
                CustomInkWell(
                    width: 150,
                    height: 150,
                    image: 'assets/images/announcementBackground.jpg',
                    title: 'Announcement',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAnnouncementScreen()));
                    },
                    textBackgroundColor: Colors.black.withOpacity(0.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
