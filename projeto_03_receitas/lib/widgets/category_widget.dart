import 'package:flutter/material.dart';
import 'package:recipes_app/models/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget(this.category);

  void _openCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (ctx) => CategoryRecipesScreen(this.category),
    //   ),
    // );
    // funciona parecido com o useHistory do React
    Navigator.of(context).pushNamed(
      '/category-recipes',
      // passando parametro para outra rota 
      // no React fazia com localStorage.set 
      // no Flutter a própria função tem o poder de passar
      arguments: this.category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openCategory(context),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.8),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
