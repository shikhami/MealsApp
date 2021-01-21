import 'package:flutter/material.dart';

import 'screens/Categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';
import './dummy.dart';
       
void main(){
  return runApp(MyApp());
}
 class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool>  _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal> _avaliableMeals =DUMMY_MEALS;
  List<Meal> _favoriteMeals=[];

   void _setFilters(Map<String, bool> filterData){
     setState((){
   _filters=filterData;
   _avaliableMeals=DUMMY_MEALS.where((meal){
     if(_filters['gluten']&& !meal.isGlutenFree){
       return false;
     }
     if(_filters['lactose']&& !meal.isLactoseFree){
       return false;
     }
     if(_filters['vegan']&& !meal.isVegan){
       return false;
     }
     if(_filters['vegetarian']&& !meal.isVegetarian){
       return false;
     }
     return true;
   }).toList();
     });

   }

   void _toggleFavorite(String mealId){
     final existingIndex=
     _favoriteMeals.indexWhere((meal) => meal.id==mealId);
     if(existingIndex>=0){
       setState(() {
         _favoriteMeals.removeAt(existingIndex);
       });
     } else{
       setState(() {
         _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId),);
       });
     }
   }
   
   bool _isFavoriteMeal(String id){
     return _favoriteMeals.any((meal)=>meal.id==id);
   }


   @override
    Widget build(BuildContext context) {
     return MaterialApp(
       theme: ThemeData(primarySwatch: Colors.pink,
       accentColor: Colors.amber,
       canvasColor: Color.fromRGBO(220, 220, 230, 2),
       textTheme: ThemeData.light().textTheme.copyWith(
         body1: TextStyle(color: Color.fromRGBO(20, 52, 52, 1),
         ),
         body2: TextStyle(color: Color.fromRGBO(20, 52, 52, 1),
         ),
       
       title: TextStyle(
         fontSize: 20,
       )
       ),
       ),
     // home: CategoriesScreen(),  
     initialRoute:'/',
      routes:{
       // '/': (ctx) => CategoriesScreen(),
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealScreen.routeName : (ctx) => CategoryMealScreen(_avaliableMeals),
        MealDetailScreen.routeName:(ctx)=> MealDetailScreen(_toggleFavorite,
         _isFavoriteMeal),
        FiltersScreen.routeName:(ctx)=> FiltersScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings){
        print(settings.arguments);
        return MaterialPageRoute(builder:(ctx)=> CategoriesScreen());
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(
          builder:(ctx)=> CategoriesScreen()
        );
      },
    );
  }
}

