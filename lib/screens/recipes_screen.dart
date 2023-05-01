import 'package:flutter/material.dart';
import 'package:gym_graduation_app/models/recipe_model.dart';
import '../components/custom_inkwell.dart';
import '../constants.dart';
import 'recipe_details_screen.dart';

// ignore: must_be_immutable
class RecipesScreen extends StatelessWidget {
  RecipesScreen({super.key, required this.recipesList});
  List<RecipeModel> recipesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Meal Recipes",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        itemCount: recipesList.length,
        itemBuilder: ((context, index) {
          return CustomInkWell(
            isNetworkImg: true,
            textBackgroundColor: Colors.white.withOpacity(0.2),
            image: recipesList[index].img!,
            title: recipesList[index].name,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RecipeDetailsScreen(recipe: recipesList[index]);
              }));
            },
          );
        }),
      ),
    );
  }
}
