import 'package:flutter/material.dart';

enum Complexity {
  simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
});
}

// اللي تحت دي طريقة عمل الاوبجكت من الكلاس
// Meal m1 = Meal(
//
//   categories:null,
//   title:null,
//   imageUrl:null,
//   ingredients:null,
//   steps:null,
//   duration:null,
//   complexity:Complexity.simple,
//   affordability:Affordability.Affordable,
//   isGlutenFree:null,
//   isLactoseFree:null,
//   isVegan:null,
//   isVegetarian:null,);