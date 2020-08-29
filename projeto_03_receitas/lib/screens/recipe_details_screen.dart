import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';

class RecipeDetailsScreen extends StatelessWidget {

  final void Function(Recipe) onToogleFavorite;
  final bool Function(Recipe) _wasFavorited;

  const RecipeDetailsScreen(this.onToogleFavorite, this._wasFavorited);

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 290,
      height: 225,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_wasFavorited(recipe) ? Icons.star : Icons.star_border),
        onPressed: () {
          onToogleFavorite(recipe);
          // dar pop na pilha de navegação e passar o recipe.title
          // para o componente anterior que chamou esta tela, neste caso é o 
          // recipe_widget
          // Navigator.of(context).pop(recipe.title);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 275,
              width: double.infinity,
              child: Image.network(recipe.imageUrl, fit: BoxFit.cover),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                itemCount: recipe.ingredients.length,
                itemBuilder: (ctx, i) {
                  var ingredient = recipe.ingredients[i];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10,
                      ),
                      child: Text(ingredient),
                    ),
                    color: Theme.of(context).accentColor,
                  );
                },
              ),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              ListView.builder(
                itemCount: recipe.steps.length,
                itemBuilder: (ctx, i) {
                  var step = recipe.steps[i];
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${i + 1}'),
                        ),
                        title: Text(step),
                      ),
                      // o hr do html
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
