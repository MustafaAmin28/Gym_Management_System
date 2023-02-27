import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../components/custom_elevated_button.dart';
import '../components/custom_text_field.dart';
import '../constants.dart';
import '../services/users.dart';

class AddTraineeScreen extends StatefulWidget {
  AddTraineeScreen();

  @override
  State<AddTraineeScreen> createState() => _AddTraineeScreenState();
}

class _AddTraineeScreenState extends State<AddTraineeScreen> {
  final ImagePicker _picker = ImagePicker();

  String? traineeName;

  int? traineeId;

  int? traineeAge;

  String? traineePhone;

  String? traineeEmail;

  num? traineeWeight;

  num? traineeHeight;

  Uint8List? selectedImage;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    showBottomSheet(context);
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 68,
                      backgroundImage: (selectedImage != null
                              ? MemoryImage(selectedImage!)
                              : const AssetImage(
                                  'assets/images/Trainer_avatar.png'))
                          as ImageProvider,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  fillColor: Colors.white.withOpacity(0.1),
                  hintText: 'Enter Trainee Name',
                  labelText: 'Name',
                  mainColor: kPrimaryColor,
                  validate: (data) {
                    if (data!.isEmpty || data == null) {
                      return "This field is required!";
                    } else if (data.length < 5) {
                      return "Please enter your full name";
                    }
                  },
                  onChange: (data) {
                    try {
                      traineeName = data;
                    } on Exception catch (e) {
                      print(e);
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  fillColor: Colors.white.withOpacity(0.1),
                  hintText: 'Enter Trainee ID',
                  labelText: 'ID',
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
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  fillColor: Colors.white.withOpacity(0.1),
                  hintText: 'Enter Trainee Age',
                  labelText: 'Age',
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
                      traineeAge = int.parse(data);
                    } on Exception catch (e) {
                      print(e);
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  fillColor: Colors.white.withOpacity(0.1),
                  hintText: 'Enter Trainee Phone',
                  labelText: 'Phone',
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
                      traineePhone = data;
                    } on Exception catch (e) {
                      print(e);
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  fillColor: Colors.white.withOpacity(0.1),
                  hintText: 'Enter Trainee Email',
                  labelText: 'Email',
                  mainColor: kPrimaryColor,
                  keyboardType: TextInputType.emailAddress,
                  validate: (data) {
                    if (data!.isEmpty || data == null) {
                      return "This field is required!";
                    }
                  },
                  onChange: (data) {
                    try {
                      traineeEmail = data;
                    } on Exception catch (e) {
                      print(e);
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  fillColor: Colors.white.withOpacity(0.1),
                  hintText: 'Enter Trainee Weight',
                  labelText: 'Weight',
                  keyboardType: TextInputType.number,
                  regExp: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[0-9]+(\.[0-9]*)?$'))
                  ],
                  validate: (data) {
                    if (data!.isEmpty || data == null) {
                      return "This field is required!";
                    }
                  },
                  mainColor: kPrimaryColor,
                  onChange: (data) {
                    try {
                      traineeWeight = double.parse(data);
                    } on Exception catch (e) {
                      print(e);
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  fillColor: Colors.white.withOpacity(0.1),
                  hintText: 'Enter Trainee Height',
                  labelText: 'Height',
                  mainColor: kPrimaryColor,
                  keyboardType: TextInputType.number,
                  regExp: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[0-9]+(\.[0-9]*)?$'))
                  ],
                  validate: (data) {
                    if (data!.isEmpty || data == null) {
                      return "This field is required!";
                    }
                  },
                  onChange: (data) {
                    try {
                      traineeHeight = double.parse(data);
                    } on Exception catch (e) {
                      print(e);
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomElevatedButton(
                    buttonText: 'Submit',
                    height: 60,
                    width: 100,
                    buttonColor: kPrimaryColor,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        Users.add({
                          'role': 'trainee',
                          'id': traineeId,
                          'name': traineeName,
                          'age': traineeAge,
                          'email': traineeEmail,
                          'phone': traineePhone,
                          'image': selectedImage,
                          'weight': traineeWeight,
                          'height': traineeWeight,
                          'myTrainers': [
                            {
                              'role': 'trainer',
                              'id': 1,
                              'name': 'Mostafa Lotfy',
                              'age': 20,
                              'email': 'mostafa.lotfy@gmail.com',
                              'phone': '+201145589634',
                              'weight': 70.0,
                              'height': 174.0,
                              'trainClass': 'Fitness',
                              'biography': 'no biography yet',
                              'yearsOfExp': 3
                            },
                          ],
                        });
                        Navigator.pop(context);
                      }
                    }),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ))
      ],
    ));
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
      context: context,
      builder: (context) => Container(
        height: 150,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.camera_alt,
              ),
              title: const Text('Pick an image from gallery'),
              onTap: () async {
                final XFile? photo =
                    await _picker.pickImage(source: ImageSource.gallery);
                selectedImage = await photo!.readAsBytes();
                setState(() {});
                Navigator.pop(context);
              },
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
              indent: 15,
              endIndent: 15,
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a picture'),
              onTap: () async {
                final XFile? photo =
                    await _picker.pickImage(source: ImageSource.camera);
                selectedImage = await photo!.readAsBytes();
                setState(() {});
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
