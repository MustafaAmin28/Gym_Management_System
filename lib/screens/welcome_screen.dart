import 'package:flutter/material.dart';
import '../components/custom_elevated_button.dart';
import '../constants.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'WelcomeScreen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(kBackgroundImage), fit: BoxFit.cover),
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
                  CustomElevatedButton(
                      buttonText: 'Start',
                      height: 40,
                      width: 150,
                      buttonColor: kPrimaryColor,
                      onTap: () async {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (route) => false);
                      }),
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
