class RecipeModel {
  final String imgPath;
  final String name;
  final List<String> ingredients;
  final List<String> steps;
  final List<String> nutritionalValue;

  RecipeModel(
      {required this.imgPath,
      required this.name,
      required this.ingredients,
      required this.steps,
      required this.nutritionalValue});
}
