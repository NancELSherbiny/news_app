import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import '../model/NewsResponse.dart';
import '../my_theme.dart';
import '../news/news_item.dart';

class NewsSeatchDelegate  extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){

      }, icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.of(context).pop();
    }, icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
      return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
      if(query.isEmpty){
        return Center(child: Text('suggestions'),);
      }
      return FutureBuilder<NewsResponse>(
        future: ApiManager.searchNews(query),
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.primaryColor,
              ),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.searchNews(query);
                }, child: Text('Try again'))
              ],
            );
          }
          if(snapshot.data?.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data?.message??'Something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.searchNews(query);
                }, child: Text('Try again'))
              ],
            );
          }
          var newsList = snapshot.data?.articles??[];
          return ListView.builder(
            itemBuilder: (context, index){
              return NewsItem(news: newsList[index]);
            },
            itemCount: newsList.length,);
        });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: MyTheme.primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: MyTheme.primaryColor,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      )
    );

  }
  
}