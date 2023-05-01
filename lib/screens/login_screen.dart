import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/helper/api.dart';
import 'package:gym_graduation_app/models/person_model.dart';
import 'package:gym_graduation_app/models/trainee_model.dart';
import 'package:gym_graduation_app/models/trainer_model.dart';
import 'package:gym_graduation_app/screens/admin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/custom_elevated_button.dart';
import '../components/custom_text_field.dart';
import '../constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_screen.dart';
import 'register_screen.dart';

PersonModel? loggedUser;

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController serverController = TextEditingController();

  bool hidden = true;

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
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  GestureDetector(
                    onDoubleTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            backgroundColor: kBackgroundColor,
                            title: Center(),
                            children: [
                              TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  label: Text(
                                    "ServerIP:Port",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  hintText: "ServerIP:Port",
                                  hintStyle: TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                                controller: serverController,
                              ),
                              CustomElevatedButton(
                                  buttonText: "Submit",
                                  height: 40,
                                  width: 80,
                                  buttonColor: kPrimaryColor,
                                  onTap: () async {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString("server", serverController.text);
                                    server = serverController.text;
                                    Navigator.pop(context);
                                  })
                            ]),
                      );
                    },
                    child: Image.asset(
                      kLogoImage,
                      height: 300,
                      width: 300,
                    ),
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
                    controller: emailController,
                    validate: (data) {
                      if (data!.isEmpty) {
                        return "This field is required!";
                      }
                      return null;
                    },
                    hintText: "Enter your email",
                    labelText: "Email",
                    mainColor: kPrimaryColor,
                    fillColor: Colors.black.withOpacity(0.5),
                    ico: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.envelope,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    validate: (data) {
                      if (data!.isEmpty) {
                        return "This field is required!";
                      } else if (data.length < 8) {
                        return "Password incorrect! It cannot be less than 8 characters";
                      }
                      return null;
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
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //         activeColor: kPrimaryColor,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(2.0),
                  //         ),
                  //         side: const BorderSide(color: kPrimaryColor, width: 2),
                  //         value: isAdmin,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             isAdmin = value!;
                  //           });
                  //         }),
                  //     const Text(
                  //       'Admin',
                  //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  //     )
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  CustomElevatedButton(
                    buttonText: "Login",
                    height: 50,
                    width: 380,
                    buttonColor: kPrimaryColor,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await login(context);
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

  Future<void> login(BuildContext context) async {
    final response = await Api.login(body: {"email": emailController.text.trim().toLowerCase(), "password": passwordController.text.trim()});
    if (response["status"] == "success") {
      emailController.clear();
      passwordController.clear();
      assignUser(response);
      // ignore: use_build_context_synchronously
    } else {
      Fluttertoast.showToast(msg: response["message"]);
    }
  }

  void assignUser(response) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userResponse = await Api.getUser(userId: response["id"]);
    if (userResponse["status"] == "success") {
      if (userResponse["user"]["role"] == "user" || userResponse["user"]["role"] == "trainee") {
        loggedUser = TraineeModel.fromMap(userResponse);
        prefs.setString('user', jsonEncode(userResponse));

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else if (userResponse["user"]["role"] == "trainer") {
        final trainerResponse = await Api.getTrainer(trainerEmail: userResponse["user"]["email"]);

        loggedUser = TrainerModel.fromMap(trainerResponse);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        prefs.setString('trainer', jsonEncode(trainerResponse));
      } else if (userResponse["user"]["role"] == "admin") {
        prefs.setString('admin', userResponse["user"]["email"]);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AdminScreen()));
      } else {
        Fluttertoast.showToast(msg: "there is an error");
      }
    } else {
      Fluttertoast.showToast(msg: userResponse["message"]);
    }
  }
}
