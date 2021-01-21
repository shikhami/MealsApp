import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';
class MealItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  //final Function removeItem;

  MealItem({
    @required this.title,
    @required this.id,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
   // @required this.removeItem,
  });

   String get complexityText{
     switch(complexity){
       case Complexity.Simple:
       return 'simple';
       break;
       case Complexity.Challenging:
       return 'challenging';
       break;
       case Complexity.Hard:
       return 'hard';
       break;
       default:
       return 'unknown';
     }
   }
 String get affordabilityText{
   switch(affordability){
       case Affordability.Affordable:
       return 'simple';
       break;
       case Affordability.Pricey:
       return 'challenging';
       break;
       case Affordability.Luxurious:
       return 'luxurious';
       break;
       default:
       return 'unknown';
     }
 }
       void selectMeal(BuildContext context){
         Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id,
         ).then((result){
           if(result!=null){
          // removeItem(result);
           }
         });
       }

        @override
       Widget build(BuildContext context) {
       return InkWell(
         onTap: ()=>selectMeal(context),
         child: Card(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                       child: Image.network(
                        imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned( 
                      bottom: 20,
                      right: 10,
                         child: Container(
                           //height: 50,
                           width: 300,
                           color: Colors.black54,
                           padding: EdgeInsets.symmetric(vertical:10,
                           horizontal:10,),
                           child: Text(
                        title, style: TextStyle(fontSize: 26,
                      color: Colors.white,
                      ),
                      softWrap: true,
                     overflow: TextOverflow.fade,
                      ),
                         ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 5,),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 5,),
                        Text(complexityText),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 5,),
                        Text(affordabilityText),
                      ],
                    ),
                  ],
                )
              ],
            ),
            ),
            );
  }
}
