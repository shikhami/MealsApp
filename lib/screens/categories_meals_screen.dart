import 'package:flutter/material.dart';

//import '../dummy.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName='cateoriesMeals';
  final List<Meal> avaliableMeals;
  //final Function toggleFavorite;

  CategoryMealScreen(this.avaliableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayMeals;
  var loadedInitData = false;
 @override
  void initState() {
     
    super.initState();
  }

@override
  void didChangeDependencies() {
    if(!loadedInitData){
    final routeArgs= ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
     displayMeals= widget.avaliableMeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
     categoryTitle = routeArgs['title'];
     loadedInitData=true;
    super.didChangeDependencies();
    }
  }

  void removeMeal(String mealId){
   setState(() {
     displayMeals.removeWhere((meal) => meal.id== mealId);
   });
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title:Text(categoryTitle),),
      body: ListView.builder(
        itemBuilder: (ctx, index){
   return MealItem(
     //removeItem: removeMeal,
     id: displayMeals[index].id,
     title: displayMeals[index].title,
   imageUrl: displayMeals[index].imageUrl,
   duration: displayMeals[index].duration,
   complexity: displayMeals[index].complexity,
   affordability: displayMeals[index].affordability,
   );
        },
    itemCount:   displayMeals.length,
      ),
    );
  }
}