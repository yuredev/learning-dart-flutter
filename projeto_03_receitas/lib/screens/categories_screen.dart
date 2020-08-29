import 'package:flutter/material.dart';
import '../widgets/category_widget.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView(
        // Sliver = area com Scroll
        // Grid delegate: display grid
        // WithMaxCrossAxisExtent: extender cross axis que é o horizontal,
        // uma vez que a main axis é vertical
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          // quanto cada elemento do cross do grid ocupa
          maxCrossAxisExtent: 200,
          // proporção
          childAspectRatio: 3 / 2,
          // espaçamento do eixo cruzado
          crossAxisSpacing: 16,
          // espaçamento do eixo principal
          mainAxisSpacing: 16,
        ),
        children: DUMMY_CATEGORIES.map((cat) => CategoryWidget(cat)).toList(),
      ),
    );
  }
}
