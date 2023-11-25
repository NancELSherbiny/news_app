import 'package:flutter/material.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/category/category_fragment.dart';
import 'package:news_app/home_screen/home_drawer.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/search/news_search_delegate.dart';
import 'package:news_app/settings/settings_tab.dart';
import '../category/category.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: MyTheme.whiteColor,
            child: Image.asset(
              'assets/images/pattern.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 2,
              centerTitle: true,
              title: Text(
                selectedDrawerItem == HomeDrawer.settings? 'Settings':
                selectedCategory == null ?'News App': selectedCategory!.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              actions: [
                IconButton(onPressed: (){
                  showSearch(context: context, delegate: NewsSeatchDelegate());
                }, icon: Icon(Icons.search))
              ],
            ),
            drawer: Drawer(
              child: HomeDrawer(
                onDrawerClick: onDrawerClick) ,
              ),
            body: selectedDrawerItem == HomeDrawer.settings?
                SettingsTab():

            selectedCategory ==null?
            CategoryFragment(
              onCategoryClick: onCategoryClick,
            ):
            CategoryDetails(
                category: selectedCategory!),
        )
      ],
    );
  }

  Category? selectedCategory;
  void onCategoryClick(Category newSelectedCategory){
    selectedCategory = newSelectedCategory;
    setState(() {

    });
  }

  int selectedDrawerItem = HomeDrawer.categories;
  void onDrawerClick(int newSelectedDrawerItem){
    selectedCategory = null;
    selectedDrawerItem = newSelectedDrawerItem;
    Navigator.pop(context);
    setState(() {
      
    });

  }
}
