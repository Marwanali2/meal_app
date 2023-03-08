import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  final List<Meal> _availableMeals;
  const CategoriesMealsScreen(this._availableMeals,{Key key}) : super(key: key);
  static const routeName = 'categories_meals';

  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String CategoryTitle;
  List<Meal>CategoryMeals;
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    final routeArg =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    final CategoryId = routeArg['id'];
     CategoryTitle = routeArg['title'];
     CategoryMeals = widget._availableMeals.where(
          (meal) {
        return meal.categories.contains(CategoryId);
      },
    ).toList();
  }


  _removeMeal(String mealId) {
    setState(() {
      CategoryMeals.removeWhere((meal) => meal.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(CategoryTitle),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            title: CategoryMeals[index].title,
            imageUrl: CategoryMeals[index].imageUrl,
            duration: CategoryMeals[index].duration,
            affordability: CategoryMeals[index].affordability,
            complexity: CategoryMeals[index].complexity,
            id: CategoryMeals[index].id,
          );
        },
        itemCount: CategoryMeals.length,
      ),
    );
  }


}
