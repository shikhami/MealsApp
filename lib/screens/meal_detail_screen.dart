import 'package:flutter/material.dart';

import '../dummy.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSelectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text('welcome to meal_detail'),
        ),
        body: SingleChildScrollView(
                  child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSelectionTitle(context, 'ingredients'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Text(selectedMeal.ingredients[index])),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSelectionTitle(context, 'steps'),
              buildContainer(ListView.builder(
                itemBuilder:(ctx, index) => Column(
                  children: [
                    ListTile(leading: CircleAvatar(child: Text('${(index+1)}'),
                    ),
                    title: Text(selectedMeal.steps[index],),
                    ),
                  Divider(color: Colors.black38),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ))
             
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(child:
        Icon(isFavorite(mealId)?Icons.star:Icons.star_border,
          
          //Icons.delete
          ),
        onPressed: ()=>toggleFavorite(mealId),
        //(){
         // Navigator.of(context).pop(mealId);
        //},
        ),
        );
  }
}
