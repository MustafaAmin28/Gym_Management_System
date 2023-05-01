import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  String hintText, labelText;
  IconButton? ico;
  bool hidden = false;
  Color mainColor;
  Color? fillColor;
  Function(String)? onChange;
  TextInputType? keyboardType;
  List<TextInputFormatter>? regExp;
  TextEditingController? controller;
  int? maxLines;

  String? Function(String?)? validate;
  CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.labelText,
      this.hidden = false,
      this.ico,
      this.onChange,
      this.validate,
      this.mainColor = Colors.white,
      this.fillColor,
      this.keyboardType,
      this.regExp,
      this.controller,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        minLines: 1,
        maxLines: maxLines,
        controller: controller,
        validator: validate,
        obscureText: hidden,
        onChanged: onChange,
        keyboardType: keyboardType,
        inputFormatters: regExp,
        style: TextStyle(color: mainColor),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          label: Text(
            labelText,
            style: TextStyle(color: mainColor),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: mainColor),
          suffixIcon: ico,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: mainColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: mainColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: BorderSide(
              color: mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
