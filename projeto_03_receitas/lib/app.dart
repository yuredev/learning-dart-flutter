import 'package:flutter/material.dart';
import 'package:recipes_app/screens/recipe_details_screen.dart';
import 'package:recipes_app/screens/settings_screen.dart';
import './screens/category_recipes_screen.dart';
import './screens/tabs_screen.dart';
import './models/recipe.dart';
import './models/settings.dart';
import './data/dummy_data.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Settings _settings = Settings();
  List<Recipe> _avaliableRecipes = DUMMY_RECIPES;
  List<Recipe> _favoritedRecipes = [];

  void _filterRecipes(Settings settings) {
    setState(() {
      this._settings = settings;
      _avaliableRecipes = DUMMY_RECIPES.where((recipe) {
        final filterGluten = settings.isGlutenFree && !recipe.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !recipe.isLactoseFree;
        final filterVegetarian = settings.isVegetarian && !recipe.isVegetarian;
        final filterVegan = settings.isVegan && !recipe.isVegan;
        return !(filterGluten || filterLactose || filterVegetarian || filterVegan);
      }).toList();
    });
  }

  void _toggleFavorite(Recipe recipe) {
    setState(() { 
      if (_favoritedRecipes.contains(recipe)) {
        _favoritedRecipes.remove(recipe);
      } else {
        _favoritedRecipes.add(recipe);
      }
     });
  }

  bool _wasFavorited(Recipe recipe) {
    return _favoritedRecipes.contains(recipe);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes App',
      theme: ThemeData(
        primaryColor: Color(0xFFEE4C6F),
        accentColor: Color(0xFFF6BB33),
        fontFamily: 'Raleway',
        canvasColor: Color(0xFFFFFEEE),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        primarySwatch: Colors.blue,
      ),
      // usando rotas, a linha abaixo não é necessária
      // home: CategoriesScreen(),
      routes: {
        // a '/' pode define a rota raiz da aplicação
        // '/': (ctx) => CategoriesScreen(),

        // a barra não é necessária nas rotas abaixo
        // está apenas por padronização
        '/recipe-details': (ctx) => RecipeDetailsScreen(_toggleFavorite, _wasFavorited),
        '/home': (ctx) => TabsScreen(_favoritedRecipes),
        '/category-recipes': (ctx) => CategoryRecipesScreen(_avaliableRecipes),
        '/settings': (ctx) => SettingsScreen(_settings, _filterRecipes),
      },
      initialRoute: '/home',
      // se a navegação for para uma rota que não foi encontrada em routes
      // o método colocado em onGenerateRoute é chamado
      // onGenerateRoute: (routeSettings) {
      //   switch (routeSettings.name) {
      //     case 'recipe-details':
      //     case 'recipe-details-screen':
      //       return MaterialPageRoute(
      //         builder: (ctx) => RecipeDetailsScreen(),
      //       );
      //     default:
      //       return MaterialPageRoute(
      //         builder: (ctx) => CategoriesScreen(),
      //       );
      //   }
      // },
      // outra forma é se a rota não foi encontrada
      // usar o onUnknowRoute
      // onUnknownRoute: (routeSettings) => MaterialPageRoute(
      //   // caso caia em uma rota que não existe
      //   // entrar na tela de categorias
      //   builder: (ctx) => CategoriesScreen(),
      // ),
    );
  }
}
