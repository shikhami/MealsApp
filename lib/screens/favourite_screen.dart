import 'package:flutter/material.dart';

import '../models/meal.dart';
import'../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavouriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
return Center(child: Text('There is no favorite yet , add some!! '),
);
    
    
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index){
   return MealItem(
    // removeItem: removeMeal,
     id: favoriteMeals[index].id,
     title: favoriteMeals[index].title,
   imageUrl: favoriteMeals[index].imageUrl,
   duration: favoriteMeals[index].duration,
   complexity: favoriteMeals[index].complexity,
   affordability: favoriteMeals[index].affordability,
   );
        },
    itemCount:  favoriteMeals.length,
      );
    }
    }
}