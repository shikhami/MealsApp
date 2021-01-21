
import 'package:flutter/foundation.dart';

enum Complexity{
  Simple,
  Challenging,
  Hard,
}

enum Affordability{
  Affordable,
  Pricey,
  Luxurious,
}


class Meal{
  final String id;
  final String title;
  final List<String> steps;
  final List<String> ingredients;
  final List<String> categories;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isLactoseFree;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;

const Meal({
  @required this.id,
  @required this.title,
  @required this.categories,
  @required this.steps,
  @required this.ingredients,
  @required this.duration,
  @required this.imageUrl,
  @required this.complexity,
  @required this.affordability,
  @required this.isVegan,
  @required this.isLactoseFree,
  @required this.isGlutenFree,
   @required this.isVegetarian,
});
}
