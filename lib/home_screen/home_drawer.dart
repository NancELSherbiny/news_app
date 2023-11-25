import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

class HomeDrawer extends StatelessWidget {
  static const categories = 1;
  static const settings = 2;
  Function onDrawerClick;
  HomeDrawer({required this.onDrawerClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.15,
          color: MyTheme.primaryColor,
          child: Text('News App',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,),
        ),
        SizedBox(height: 15,),
        InkWell(
          onTap: (){
            onDrawerClick(HomeDrawer.categories);
          } ,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.list),
                SizedBox(width: 10,),
                Text('Categories',
                style: Theme.of(context).textTheme.titleMedium,),
              ],
            ),
          ),
        ),
        InkWell(
          onTap:(){
            onDrawerClick(HomeDrawer.settings);
          } ,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 10,),
                Text('Settings',
                  style: Theme.of(context).textTheme.titleMedium,),
              ],
            ),
          ),
        )
      ],
    );
  }
}
