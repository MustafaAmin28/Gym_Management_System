import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/custom_elevated_button.dart';
import '../components/custom_inkwell.dart';
import '../components/custom_text_field.dart';
import '../constants.dart';
import '../models/trainee_model.dart';
import '../services/users.dart';
import 'profile_screen.dart';
import 'qr_scanner_screen.dart';

class CheckUserScreen extends StatelessWidget {
  CheckUserScreen({super.key});
  static String id = 'Check User Screen';
  int? traineeId;
  bool isFound = false;
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Check User",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        leading: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          CustomInkWell(
              image: 'assets/images/QR_Scan_Background.jpg',
              title: 'Scan QR',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const QrScannerScreen();
                }));
              },
              textBackgroundColor: Colors.black.withOpacity(0.5)),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            thickness: 1,
            color: kPrimaryColor,
            indent: 30,
            endIndent: 30,
          ),
          const SizedBox(
            height: 15,
          ),
          const Align(
            child: Text(
              'Search by ID',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Form(
            key: formKey,
            child: CustomTextFormField(
              fillColor: Colors.white.withOpacity(0.1),
              controller: controller,
              hintText: 'Enter Trainee ID',
              labelText: 'ID :',
              mainColor: kPrimaryColor,
              keyboardType: TextInputType.number,
              regExp: [FilteringTextInputFormatter.digitsOnly],
              validate: (data) {
                if (data!.isEmpty || data == null) {
                  return "This field is required!";
                }
              },
              onChange: (data) {
                try {
                  traineeId = int.parse(data);
                } on Exception catch (e) {
                  print(e);
                }
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomElevatedButton(
              buttonText: 'Search',
              height: 50,
              width: 180,
              buttonColor: kPrimaryColor,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  controller.clear();
                  isFound = false;
                  for (int i = 0; i < Users.length; i++) {
                    if (traineeId == Users[i]['id']) {
                      isFound = true;
                      TraineeModel searchedTrainee =
                          TraineeModel.fromMap(Users[i]);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ProfileScreen(person: searchedTrainee);
                        },
                      ));
                    }
                  }
                  if (!isFound) showResultDialog(context);
                }
              })
        ],
      ),
    );
  }

  void showResultDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          backgroundColor: kBackgroundColor,
          title: const Center(
            child: Text("Result", style: TextStyle(color: Colors.white)),
          ),
          children: [
            const SizedBox(
              height: 15,
            ),
            const Icon(
              FontAwesomeIcons.circleXmark,
              color: Colors.red,
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              child: Text("User is not found ",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Okay",
                        style: TextStyle(color: Colors.white, fontSize: 18))),
              ],
            )
          ]),
    );
  }
}
