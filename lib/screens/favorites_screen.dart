import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
    final List<Meal> favoriteMeals;
   const FavoritesScreen(this.favoriteMeals, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🤔',
              style: TextStyle(fontSize: 60),
            ),
            SizedBox(
              height: 20,
            ),
            Text(' No favorite meals yet !'),
          ],
        ),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            id: favoriteMeals[index].id,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
