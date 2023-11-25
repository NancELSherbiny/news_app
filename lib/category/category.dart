import 'dart:ui';
import 'package:news_app/my_theme.dart';

class Category{
  String id;
  String title;
  String imageUrl;
  Color color;

  Category({
    required this.id,
    required this.title,
    required this.color,
    required this.imageUrl
});

  static List<Category> getCategory(){
    return [
      Category(
        id: 'sports',
        title: 'Sports',
        color: MyTheme.redColor,
        imageUrl: 'assets/images/ball.png'),
      Category(
          id: 'general',
          title: 'General',
          color: MyTheme.darkBlueColor,
          imageUrl: 'assets/images/environment.png'),
      Category(
          id: 'health',
          title: 'Health',
          color: MyTheme.pinkColor,
          imageUrl: 'assets/images/health.png'),
      Category(
          id: 'business',
          title: 'Business',
          color: MyTheme.orangeColor,
          imageUrl: 'assets/images/bussines.png'),
      Category(
          id: 'entertainment',
          title: 'Entertainment',
          color: MyTheme.primaryColor,
          imageUrl: 'assets/images/ball.png'),
      Category(
          id: 'science',
          title: 'Science',
          color: MyTheme.yellowColor,
          imageUrl: 'assets/images/science.png'),
      Category(
          id: 'technology',
          title: 'Technology',
          color: MyTheme.lightBlueColor,
          imageUrl: 'assets/images/science.png'),

    ];
  }
}