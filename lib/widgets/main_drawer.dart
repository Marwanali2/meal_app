import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.primary,
            child: ListTile(
              title: Text(
                'Cooking Up ',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Colors.white,
                  fontSize: 29,
                  fontWeight: FontWeight.w900,
                ),
              ),
              trailing:  Icon(Icons.fastfood_outlined,color: Colors.white,size: 35),
            ),
          ),
          SizedBox(height: 20,),
          buildListTile(context,'Meals',Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(
            color: Theme.of(context).colorScheme.primary,
            thickness: 2,
          ),
          buildListTile(context, 'Filters', Icons.filter_alt_outlined,(){
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context,String title,IconData icon,Function onTap) {
    return ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),
          ),
          leading:  Icon(icon,color: Colors.black,size: 30),
        );
  }
}
