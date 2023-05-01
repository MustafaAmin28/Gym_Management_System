import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gym_graduation_app/models/trainee_model.dart';
import 'package:gym_graduation_app/models/trainer_model.dart';
import 'package:gym_graduation_app/screens/admin_screen.dart';
import 'package:gym_graduation_app/screens/home_screen.dart';
import '../constants.dart';
import 'login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final trainerPref = prefs.getString('trainer');
      final userPref = prefs.getString("user");
      final adminPref = prefs.getString("admin");
      server = prefs.getString("server");

      if (adminPref != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AdminScreen()));
      } else if (trainerPref != null) {
        final trainer = jsonDecode(trainerPref);
        loggedUser = TrainerModel.fromMap(trainer);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else if (userPref != null) {
        final user = jsonDecode(userPref);
        loggedUser = TraineeModel.fromMap(user);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    });
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(kBackgroundImage), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Image.asset(
                    kLogoImage,
                    width: 300,
                    height: 300,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "BUILD YOUR BODY",
                    style: TextStyle(
                      fontFamily: kFontFamily,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  const CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
