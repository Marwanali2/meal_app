import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreens extends StatelessWidget {
  const CategoriesScreens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:null,
      body: GridView(
        padding: EdgeInsets.fromLTRB(10, 30 , 10,35),
        children: [
          ...DUMMY_CATEGORIES
              .map(
                (catData) => CategoryItem(id: catData.id,title: catData.title,color: catData.color),
              )
              .toList(),
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // عرض الويدجت
          childAspectRatio: 1.5, // ارتفاع الويدجت (نسبة العرض الي الطول)
          crossAxisSpacing: 20, // المسافة العرضية بين كل ويدجت
          mainAxisSpacing: 20, // المسافة الطولية بين كل ويدجت
        ),
      ),
    );
  }
}
