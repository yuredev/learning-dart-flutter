import 'package:flutter/material.dart';
import 'package:recipes_app/models/category.dart';
import 'package:recipes_app/widgets/recipe_widget.dart';
import '../models/recipe.dart';

class CategoryRecipesScreen extends StatelessWidget {

  final List<Recipe> recipes;

  const CategoryRecipesScreen(this.recipes);

  @override
  Widget build(BuildContext context) {
    // pega dos argumentos enviados
    // funciona parecido com o route param da web
    final Category category = ModalRoute.of(context).settings.arguments;

    final categoryRecipes =
        recipes.where((r) => r.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryRecipes.length, 
        itemBuilder: (ctx, i) => RecipeWidget(categoryRecipes[i]),
      ),
    );
  }
}
