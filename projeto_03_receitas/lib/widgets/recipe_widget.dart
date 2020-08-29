import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';

class RecipeWidget extends StatelessWidget {
  final Recipe recipe;

  const RecipeWidget(this.recipe);

  void _openDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/recipe-details',
      arguments: this.recipe,
    ).then((favoriteRecipeTitle) {
      // print(favoriteRecipeTitle);
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openDetails(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(children: [
              // componente para mexer com bordas
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  recipe.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // tipo o float do css, mas só funciona dentro de uma stack
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  // preto com 54% de opacidade
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Text(
                    recipe.title,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                    // quebra de linha
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${recipe.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(recipe.complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(recipe.costText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
