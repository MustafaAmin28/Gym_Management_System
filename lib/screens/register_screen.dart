import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/helper/api.dart';
import 'package:image_picker/image_picker.dart';
import '../components/custom_elevated_button.dart';
import '../components/custom_text_field.dart';
import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'RegisterScreen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  bool isLoading = false, hidden = true;
  Uint8List? selectedImage;

  GlobalKey<FormState> formKey = GlobalKey();

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
                height: 45,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
                  if (photo != null) {
                    selectedImage = await photo.readAsBytes();
                  }
                  setState(() {});
                  // ignore: use_build_context_synchronously
                },
                child: CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  radius: 69,
                  backgroundImage: (selectedImage != null ? MemoryImage(selectedImage!) : const AssetImage('assets/images/Trainer_avatar.png')) as ImageProvider,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                  controller: name,
                  validate: (data) {
                    if (data!.isEmpty) return "This field is required!";
                    return null;
                  },
                  hintText: "Enter your name",
                  labelText: "Name",
                  mainColor: kPrimaryColor,
                  fillColor: Colors.black.withOpacity(0.5),
                  ico: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.userGroup,
                      color: kPrimaryColor,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  controller: email,
                  validate: (data) {
                    if (data!.isEmpty) return "This field is required!";
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
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  controller: password,
                  hidden: hidden,
                  mainColor: kPrimaryColor,
                  fillColor: Colors.black.withOpacity(0.5),
                  validate: (data) {
                    if (data!.isEmpty) {
                      return "This field is required!";
                    } else if (data.length < 8) {
                      return "Password length should be at least 8 characters.";
                    }
                    return null;
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
                  controller: confirmPassword,
                  hidden: hidden,
                  mainColor: kPrimaryColor,
                  fillColor: Colors.black.withOpacity(0.5),
                  validate: (data) {
                    if (data!.isEmpty) {
                      return "This field is required!";
                    } else if (data.length < 8) {
                      return "Password length should be at least 8 characters.";
                    }
                    return null;
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
                onTap: () async {
                  if (selectedImage != null) {
                    final response = await Api.register(imgBytes: selectedImage!, name: name.text, email: email.text, password: password.text, confirmPassword: confirmPassword.text);
                    if (response["status"] == "success") {
                      Fluttertoast.showToast(msg: "Registered succesfully!");
                      name.clear();
                      email.clear();
                      password.clear();
                      confirmPassword.clear();
                      selectedImage = null;
                      Navigator.pop(context);
                    } else {
                      Fluttertoast.showToast(msg: response["message"]);
                    }
                  } else {
                    Fluttertoast.showToast(msg: "Please choose a picture");
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
