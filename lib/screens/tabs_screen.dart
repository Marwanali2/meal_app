import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'categories_screens.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final  List<Meal> favoriteMeals;
  const TabsScreen( this.favoriteMeals, {Key key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {


  List <Map<String,Object>>_pages;
  @override
  void initState(){
    _pages=[
      {
        'page':CategoriesScreens(),
        'title':'Categories'
      },
      {
        'page':FavoritesScreen(widget.favoriteMeals), // علشان الويدجت دوت بتتحط في البيلدر او الاينيت استات
        'title':'Favorites'
      },
    ];
    super.initState();
  }
  int _selectedpageindex=0;
  void _selectpage(int value) {
    setState(() {
      _selectedpageindex=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedpageindex]['title']),
      ),
      body: _pages[_selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        currentIndex: _selectedpageindex,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.teal,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: 'Favorites'
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }


}
