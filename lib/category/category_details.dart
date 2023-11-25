import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/category/category.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/tabs/tab_container.dart';
import 'package:news_app/my_theme.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
        future: ApiManager.getSources(widget.category.id),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.primaryColor,
              ),
            );
          }else if (snapshot.hasError){
            return Column(
              children: [
                Text('something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources(widget.category.id);
                  setState(() {

                  });
                }, child: Text('try again'))
              ],
            );
          }
          if(snapshot.data?.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data?.message??''),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources(widget.category.id );
                  setState(() {

                  });
                }, child: Text('try again'))
              ],
            );
          }
          var sourcesList = snapshot.data?.sources??[];
          return TabContainer(sourcesList: sourcesList);
        },
    );
  }
}
