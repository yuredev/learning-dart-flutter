import 'package:flutter/material.dart';
import '../models/recipe.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';
import '../widgets/drawer_widget.dart';
// *** ABORDAGEM DE ABAS 1: Abas no bottom do AppBar ***

// esta abordagem é com um StatelessWidget
// dentro do build usamos o retorno:

// return DefaultTabController(
//   length: 2,// número de abas
//   // initialIndex define a aba padrão a ser aberta
//   // no inicio da execução
//   // obs: começa do 0
//   // initialIndex: 1,
//   child: Scaffold(
//     appBar: AppBar(
//       title: Text('Vamos Cozinhar'),
//       bottom: TabBar(
//         tabs: [
//           Tab(
//             text: 'Categoria',
//             icon: Icon(Icons.category),
//           ),
//           Tab(
//             text: 'Favoritos',
//             icon: Icon(Icons.star),
//           ),
//         ],
//       ),
//     ),
//     body: TabBarView(
//       children: [
//         CategoriesScreen(),
//         FavoritesScreen(),
//       ],
//     ),
//   ),
// );

// *** ABORDAGEM DE ABAS 2: Abas no bottomNavigationBar de Scaffold ***

// para armazenar o índice da tela atual a ser exibida, o componente precisa
// ter estado, assim usamos um StatefulWidget, ao contrário da opção anterior

class TabsScreen extends StatefulWidget {
  
  final List<Recipe> favoritedRecipes;

  const TabsScreen(this.favoritedRecipes);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Receitas Favoritas',
        'screen': FavoritesScreen(widget.favoritedRecipes),
      },
    ];
  }

  void _selectScreen(int index) {
    setState(() => this._selectedScreenIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
      ),
      drawer: DrawerWidget(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: this._selectScreen,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: this._selectedScreenIndex,
        backgroundColor: Theme.of(context).primaryColor,

        // animação de navegação
        // pra usá-la é preciso que cada BottomNavigationBarItem
        // tenha uma cor definida, ao invés de usar o backgroundColor do
        // bottomNavigationBar
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categorias'),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favoritos'),
          ),
        ],
      ),
    );
  }
}
