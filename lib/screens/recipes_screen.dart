import 'package:flutter/material.dart';

import '../components/custom_inkwell.dart';
import '../constants.dart';
import '../services/recipes.dart';
import 'recipe_details_screen.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

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
        itemCount: recipes.length,
        itemBuilder: ((context, index) {
          return CustomInkWell(
            textBackgroundColor: Colors.white.withOpacity(0.2),
            image: recipes[index].imgPath,
            title: recipes[index].name,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RecipeDetailsScreen(recipe: recipes[index]);
              }));
            },
          );
        }),
      ),
    );
  }
}
