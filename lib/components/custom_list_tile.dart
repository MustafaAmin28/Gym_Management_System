import 'package:flutter/material.dart';
import '../constants.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  CustomListTile({super.key, this.onTap, this.border = false, this.leading, this.trailing, required this.title});

  String title;
  IconData? leading, trailing;
  bool border;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.only(left: 16),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      leading: leading == null ? null : Icon(leading),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Icon(trailing),
      ),
      shape: border
          ? const RoundedRectangleBorder(
              side: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )
          : null,
      iconColor: kPrimaryColor,
    );
  }
}
