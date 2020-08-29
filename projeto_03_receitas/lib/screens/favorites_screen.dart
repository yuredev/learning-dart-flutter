import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/widgets/recipe_widget.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe> favoritedRecipes;

  const FavoritesScreen(this.favoritedRecipes);

  @override
  Widget build(BuildContext context) {
    return favoritedRecipes.isNotEmpty
        ? ListView.builder(
            itemCount: favoritedRecipes.length,
            itemBuilder: (ctx, i) => RecipeWidget(favoritedRecipes[i])
          )
        : Center(
            child: Text('Nenhuma refeição marcada como favorita'),
          );
  }
}
