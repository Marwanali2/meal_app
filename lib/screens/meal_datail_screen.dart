import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail';
  final Function toggleFavorites;
  final Function isFavorites;

  const MealDetailScreen(this.toggleFavorites, this.isFavorites, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Align(alignment: Alignment.topLeft,child: Text(selectedMeal.title)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: InteractiveViewer(
                minScale:0.8,
                maxScale: 20,
                child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
              ),
            ),
            SizedBox(

              child:Text('Zoom The Image',style: TextStyle(fontSize: 15,color: Colors.black54)) ,
            ),

            buildSectionTitle(context, 'Ingredients'),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white10,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                );
              },
              itemCount: selectedMeal.ingredients.length,
            )),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                    backgroundColor: Colors.brown,
                    maxRadius: 20,
                  ),
                  title: Column(
                    children: [
                      Text(
                        selectedMeal.steps[index],
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                );
              },
              itemCount: selectedMeal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavorites(mealId);
        },
        //     () {
        //   Navigator.of(context).pop(mealId); // ال meal id بيتمرر للصفحه اللي هتروحها البوب و هيتم استقبالها بال then هناك
        // },
        backgroundColor: Colors.black54,
        child: Icon(
          isFavorites(mealId) ? Icons.star : Icons.star_border_outlined,
        ),
      ),
    );
  }

  Container buildContainer(Widget widget) {
    return Container(
      height: 250,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFFF9E80).withOpacity(1),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: widget,
    );
  }

  Container buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
