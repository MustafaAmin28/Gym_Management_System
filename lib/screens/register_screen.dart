import 'package:flutter/material.dart';

import '../components/custom_elevated_button.dart';
import '../components/custom_text_field.dart';
import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email, password, confirmPassword;

  bool isLoading = false, hidden = true;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(kBackgroundImage), fit: BoxFit.cover),
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                kLogoImage,
                height: 300,
                width: 300,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  validate: (data) {
                    if (data!.isEmpty) return "This field is required!";
                  },
                  onChange: (data) {
                    email = data;
                  },
                  hintText: "Enter your email",
                  labelText: "Email",
                  mainColor: kPrimaryColor,
                  fillColor: Colors.black.withOpacity(0.5),
                  ico: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.mail,
                      color: kPrimaryColor,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  hidden: hidden,
                  mainColor: kPrimaryColor,
                  fillColor: Colors.black.withOpacity(0.5),
                  validate: (data) {
                    if (data!.isEmpty) {
                      return "This field is required!";
                    } else if (data.length < 8) {
                      return "Password length should be at least 8 characters.";
                    }
                  },
                  onChange: (data) {
                    password = data;
                  },
                  hintText: "Enter your password",
                  labelText: "Password",
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
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  hidden: hidden,
                  mainColor: kPrimaryColor,
                  fillColor: Colors.black.withOpacity(0.5),
                  validate: (data) {
                    if (data!.isEmpty) {
                      return "This field is required!";
                    } else if (data.length < 8) {
                      return "Password length should be at least 8 characters.";
                    }
                  },
                  onChange: (data) {
                    confirmPassword = data;
                  },
                  hintText: "Confirm password",
                  labelText: "Confirm Password",
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
                  )),
              const SizedBox(
                height: 15,
              ),
              CustomElevatedButton(
                buttonText: "Register",
                height: 50,
                width: 380,
                buttonColor: kPrimaryColor,
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
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
        ),
      ),
    ));
  }
}
