import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gym_graduation_app/models/person_model.dart';
import 'package:gym_graduation_app/models/trainee_model.dart';
import 'package:gym_graduation_app/models/trainer_model.dart';
import '../components/custom_elevated_button.dart';
import '../components/custom_text_field.dart';
import '../constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/users.dart';
import 'home_screen.dart';
import 'register_screen.dart';

late PersonModel loginedUser;

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool hidden = true;
  bool isAdmin = false;
  bool adminIsFound = false;
  bool traineeIsFound = false;
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(kBackgroundImage), fit: BoxFit.cover),
        ),
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Image.asset(
                    kLogoImage,
                    height: 300,
                    width: 300,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    validate: (data) {
                      if (data!.isEmpty || data == null) {
                        return "This field is required!";
                      }
                    },
                    onChange: (data) {
                      username = data;
                    },
                    hintText: "Enter your username",
                    labelText: "Username",
                    mainColor: kPrimaryColor,
                    fillColor: Colors.black.withOpacity(0.5),
                    ico: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    validate: (data) {
                      if (data!.isEmpty) {
                        return "This field is required!";
                      } else if (data.length < 8) {
                        return "Password incorrect! It cannot be less than 8 characters";
                      }
                    },
                    onChange: (data) {
                      password = data;
                    },
                    hintText: "Enter your password",
                    labelText: "Password",
                    mainColor: kPrimaryColor,
                    fillColor: Colors.black.withOpacity(0.5),
                    hidden: hidden,
                    ico: IconButton(
                      onPressed: () {
                        setState(() {
                          hidden = !hidden;
                        });
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          side: const BorderSide(color: kPrimaryColor, width: 2),
                          value: isAdmin,
                          onChanged: (value) {
                            setState(() {
                              isAdmin = value!;
                            });
                          }),
                      const Text(
                        'Admin',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomElevatedButton(
                    buttonText: "Login",
                    height: 50,
                    width: 380,
                    buttonColor: kPrimaryColor,
                    onTap: () async {
                      bool userIsFound = false;
                      if (formKey.currentState!.validate()) {
                        for (int i = 0; i < Users.length; i++) {
                          if (username!.trim() == Users[i]['username'] && password == Users[i]['password']) {
                            userIsFound = true;
                            if (Users[i]['role'] == 'trainee') {
                              loginedUser = TraineeModel.fromMap(Users[i]);
                            } else if (Users[i]['role'] == 'trainer') {
                              loginedUser = TrainerModel.fromMap(Users[i]);
                            }
                            // debugPrint(await FirebaseMessaging.instance.getToken());
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }));
                          }
                        }
                        if (!userIsFound) {
                          Fluttertoast.showToast(msg: 'Username or Password is wrong! Please try again.', fontSize: 14);
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
