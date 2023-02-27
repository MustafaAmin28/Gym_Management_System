import 'package:flutter/material.dart';

import '../constants.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile(
      {this.onTap,
      this.border = false,
      required this.leading,
      required this.title,
      this.icon});
  Widget? leading;
  String title;
  IconData? icon;
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
      leading: leading,
      trailing: Icon(icon),
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
