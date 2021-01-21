import 'package:flutter/material.dart';

import '../widgets/categories_item.dart';
import '../dummy.dart';

 class CategoriesScreen extends StatelessWidget {
   @override
    Widget build(BuildContext context) {
     return  GridView(
         padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map(
        (catData)=>
      CategoriesItem(
      catData.title,
      catData.color,
      catData.id,
      ),
      )
      .toList(),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    childAspectRatio: 1.3,
    maxCrossAxisExtent: 200,
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    ),
    );
  }
}