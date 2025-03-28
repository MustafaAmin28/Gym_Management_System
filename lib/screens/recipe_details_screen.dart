import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../models/recipe_model.dart';

// ignore: must_be_immutable
class RecipeDetailsScreen extends StatelessWidget {
  RecipeDetailsScreen({super.key, required this.recipe});
  RecipeModel recipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: const Icon(
            FontAwesomeIcons.utensils,
            color: Colors.white,
          ),
          title: Text(
            recipe.name,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 200,
              child: recipe.img == null
                  ? Image.asset(
                      kPersonAvatar,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      recipe.img!,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "القيمة الغذائية للوجبة:",
              textDirection: TextDirection.rtl,
              style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 24),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recipe.nutration.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      "- ${recipe.nutration[index]}",
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                })),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
              indent: 12,
              endIndent: 12,
            ),
            const Text(
              "المكونات:",
              textDirection: TextDirection.rtl,
              style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 24),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: recipe.ingredients.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      "- ${recipe.ingredients[index]}",
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                })),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
              indent: 12,
              endIndent: 12,
            ),
            const Text(
              "الخطوات:",
              textDirection: TextDirection.rtl,
              style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 24),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recipe.steps.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      "- ${recipe.steps[index]}",
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                })),
          ],
        ));
  }
}
