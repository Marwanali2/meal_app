import 'package:flutter/material.dart';
import './screens/categories_meals_screens.dart';
import './screens/filters_screen.dart';
import './screens/meal_datail_screen.dart';
import './screens/tabs_screen.dart';
import './models/meal.dart';
import 'dummy_data.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lacoste': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(
      () {
        _filters = filterData;
        _availableMeals = DUMMY_MEALS.where(
          (meal) {
            if(_filters['gluten']&&!meal.isGlutenFree){
              return false;
            }
            if(_filters['lacoste']&&!meal.isLactoseFree){
              return false;
            }
            if(_filters['vegan']&&!meal.isVegan){
              return false;
            }
            if(_filters['vegetarian']&&!meal.isVegetarian){
              return false;
            }
            return true;
          },
        ).toList();
      },
    );
  }
  void _toggleFavorites(String mealId){
    final existingIndex=_favoriteMeals.indexWhere((meal) =>meal.id==mealId);
    if(existingIndex>=0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) =>meal.id==mealId ));
      });
    }
  }
  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFFFF9E80).withOpacity(1), // app bar color
        ),
        canvasColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
          bodyText2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
          subtitle1: TextStyle(
            fontSize: 20,
            fontFamily: 'Raleway',
          ),
        ),
      ),
     // home: CategoriesScreens(),
      routes: {
        '/': (context) =>TabsScreen(_favoriteMeals),
        CategoriesMealsScreen.routeName: (context) => CategoriesMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorites,_isMealFavorite),
        FilterScreen.routeName: (context) => FilterScreen(_filters,_setFilters),
      },
    );
  }
}