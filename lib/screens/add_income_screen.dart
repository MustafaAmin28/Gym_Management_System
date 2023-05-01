import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/components/custom_elevated_button.dart';
import 'package:gym_graduation_app/components/custom_text_field.dart';

import '../constants.dart';
import '../helper/api.dart';

class AddIncomeScreen extends StatefulWidget {
  const AddIncomeScreen({super.key});

  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  TextEditingController income = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Add Income",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        leading: const Icon(
          FontAwesomeIcons.sackDollar,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            maxLines: 3,
            hintText: "Icome",
            labelText: "Income",
            controller: income,
            fillColor: Colors.white.withOpacity(0.1),
            mainColor: kPrimaryColor,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            hintText: "Price",
            labelText: "Price",
            controller: price,
            fillColor: Colors.white.withOpacity(0.1),
            mainColor: kPrimaryColor,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomElevatedButton(
              buttonText: "Add",
              height: 50,
              width: double.infinity,
              buttonColor: kPrimaryColor,
              onTap: () async {
                if (price.text.isNotEmpty && income.text.isNotEmpty) {
                  final response = await Api.addIncome(body: {"reason": income.text, "price": double.parse(price.text)});
                  if (response["status"] == "success") {
                    Fluttertoast.showToast(msg: "Submitted");
                    income.clear();
                    price.clear();
                  } else {
                    Fluttertoast.showToast(msg: response["message"]);
                  }
                } else {
                  Fluttertoast.showToast(msg: "Please fill all fields before submitting");
                }
              })
        ],
      ),
    );
  }
}
