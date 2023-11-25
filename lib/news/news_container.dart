import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/news/news_item.dart';

import '../model/source_response.dart';

class NewsContainer extends StatefulWidget {
  Source source;
  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();

}

class _NewsContainerState extends State<NewsContainer> {
  final scrollController = ScrollController();
  int pageNumber = 1;
  List<News>news=[];
  bool shouldLoadNextPage = false;

  @override
  void initState(){
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.atEdge){
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop){
          shouldLoadNextPage = true;
          setState(() {

          });
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    if(shouldLoadNextPage){
      ApiManager.getNewsBySourceId(sourceId: widget.source.id??'',
          pageNumber: pageNumber++).then((newsResponse) =>
          news.addAll(newsResponse?.articles??[]));
    }
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(sourceId: widget.source.id??''),
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
                  ApiManager.getNewsBySourceId(sourceId: widget.source.id??'');
                  setState(() {

                  });
                }, child: Text('Try again'))
              ],
            );
          }
          if(snapshot.data?.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data?.message??'Something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceId(sourceId: widget.source.id??'');
                  setState(() {

                  });
                }, child: Text('Try again'))
              ],
            );
          }
          var newsList = snapshot.data?.articles??[];
          if(news.isEmpty){
            news=newsList;
          }
          return ListView.builder(
            controller: scrollController,
              itemBuilder: (context, index){
                return NewsItem(news: news[index]);
          },
          itemCount: news.length,);
        });
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
